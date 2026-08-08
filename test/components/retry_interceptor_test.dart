import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:base_flutter_mvvm_getx_app/components/network/interceptors/retry_interceptor.dart';

class _FailThenSucceedAdapter implements HttpClientAdapter {
  int attempts = 0;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    attempts++;
    if (attempts == 1) {
      throw DioException(
        requestOptions: options,
        type: DioExceptionType.connectionTimeout,
      );
    }
    return ResponseBody.fromString('{"ok":true}', 200, headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    });
  }
}

void main() {
  test('RetryInterceptor retries GET on connection timeout then succeeds', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
    final adapter = _FailThenSucceedAdapter();
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(RetryInterceptor(dio, maxRetries: 2, retryDelay: Duration.zero));

    final response = await dio.get<dynamic>('/ping');
    expect(response.statusCode, 200);
    expect(adapter.attempts, 2);
  });

  test('RetryInterceptor does not retry POST', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.com'));
    final adapter = _FailThenSucceedAdapter();
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(RetryInterceptor(dio, maxRetries: 2, retryDelay: Duration.zero));

    await expectLater(
      () => dio.post<dynamic>('/ping'),
      throwsA(isA<DioException>()),
    );
    expect(adapter.attempts, 1);
  });
}
