import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_elements_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_resources_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/services/network_service/interceptors/auth_interceptor.dart';
import 'package:base_flutter_mvvm_getx_app/services/secure_storage_service/secure_storage_service_abstraction.dart';

class _FakeSecureStorage extends CoreService implements SecureStorageService {
  _FakeSecureStorage(this.token);

  final String? token;

  @override
  Future<BaseLocalResponse<T?>> read<T>(AppStorageKeys key) async => Right(token as T?);

  @override
  Future<BaseLocalResponse<bool>> write<T>({required AppStorageKeys key, required T value}) async => const Right(true);

  @override
  Future<BaseLocalResponse<bool>> remove(AppStorageKeys? key) async => const Right(true);

  @override
  Future<BaseLocalResponse<bool>> hasData(AppStorageKeys key) async => const Right(true);
}

class _CaptureAdapter implements HttpClientAdapter {
  RequestOptions? lastOptions;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<List<int>>? requestStream, Future<void>? cancelFuture) async {
    lastOptions = options;
    return ResponseBody.fromString(
      '{}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }
}

void main() {
  setUp(() {
    Get.testMode = true;
    Get.reset();
  });

  tearDown(Get.reset);

  test('shouldSkip reads extra flag and X-Skip-Auth header', () {
    expect(AuthInterceptor.shouldSkip(RequestOptions(path: '/x', extra: {AuthInterceptor.skipAuthExtraKey: true})), isTrue);
    expect(AuthInterceptor.shouldSkip(RequestOptions(path: '/x', headers: {AppTexts.dioHeaderSkipAuth: 'true'})), isTrue);
    expect(AuthInterceptor.shouldSkip(RequestOptions(path: '/x')), isFalse);
  });

  test('attaches Bearer token from SecureStorageService', () async {
    Get.put<SecureStorageService>(_FakeSecureStorage('abc123'), permanent: true);
    final dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
    final adapter = _CaptureAdapter();
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(AuthInterceptor());

    await dio.get<dynamic>('/me');

    expect(adapter.lastOptions?.headers[AppTexts.dioHeaderAuthorization], 'Bearer abc123');
  });

  test('skipAuth extra does not attach Authorization', () async {
    Get.put<SecureStorageService>(_FakeSecureStorage('abc123'), permanent: true);
    final dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
    final adapter = _CaptureAdapter();
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(AuthInterceptor());

    await dio.get<dynamic>('/login', options: Options(extra: {AuthInterceptor.skipAuthExtraKey: true}));

    expect(adapter.lastOptions?.headers[AppTexts.dioHeaderAuthorization], isNull);
  });
}
