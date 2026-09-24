import 'dart:io';

import 'package:dio/dio.dart' as dio;

import '../../barrels/annotations_barrel.dart';
import '../../barrels/components_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/services_barrel.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

export 'api_methods.dart';
export '../../core/core_resources/response_status_api.dart';

typedef APIResponse = dio.Response;

@GetPut.service()
class DioCore extends CoreService {
  static DioCore get to => Get.find();

  late final dio.Dio client;

  @override
  void onInit() {
    client = dio.Dio(
      dio.BaseOptions(
        baseUrl: EnvConfig.apiBaseUrl,
        connectTimeout: AppDefaults.timeOutConnection,
        receiveTimeout: AppDefaults.timeOutConnection,
        sendTimeout: AppDefaults.timeOutConnection,
        contentType: AppTexts.dioHeaderContentTypeData,
        headers: const {AppTexts.dioHeaderContentType: 'application/json', 'Accept': 'application/json'},
      ),
    );
    client.interceptors.addAll([AuthInterceptor(), RetryInterceptor(client), LoggingInterceptor()]);
    super.onInit();
  }

  /// Shared singleton Dio instance (never allocate per request).
  dio.Dio get dioCore => client;

  Future<BaseAPIResponse<T>> callMethod<T>({
    required APIMethods method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool skipAuth = false,
  }) async {
    try {
      final options = dio.Options(
        method: method.getName,
        receiveTimeout: AppDefaults.timeOutConnection,
        sendTimeout: AppDefaults.timeOutConnection,
        contentType: AppTexts.dioHeaderContentTypeData,
        extra: {AuthInterceptor.skipAuthExtraKey: skipAuth},
        headers: {
          AppTexts.dioHeaderContentType: 'application/json',
          if (skipAuth) AppTexts.dioHeaderSkipAuth: 'true',
          if (headers != null) ...headers,
        },
      );
      _increaseStatisticApiCall();
      final result = await client.request<dynamic>(url, queryParameters: queryParameters, options: options, data: data);
      if (ResponseStatusAPI.values.find(result.statusCode ?? 0).isSuccess == true) {
        return Right(result.data as T);
      }
      _printException(method.getName, ['Result Data: ${result.data} (${result.statusCode})', 'Result Message: ${result.statusMessage}']);
      return Left(ResponseStatusAPI.values.find(result.statusCode ?? 0).exception);
    } on dio.DioException catch (ex, stackTrace) {
      _printException(method.getName, ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex) {
      _printException(method.getName, ['$ex']);
      return Left(NetworkException(message: ex.toString(), statusCode: 0));
    }
  }

  Future<BaseAPIResponse<File>> download({required String url, required String savePath, bool skipAuth = false}) async {
    try {
      _increaseStatisticApiCall();
      final APIResponse result = await client.download(
        url,
        savePath,
        options: dio.Options(extra: {AuthInterceptor.skipAuthExtraKey: skipAuth}),
      );
      if (result.statusCode == 200) {
        _printResponse('DOWNLOAD', result);
        return Right(File(savePath));
      }
      _printException(APIMethods.download.getName, ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
      return Left(ResponseStatusAPI.values.find(result.statusCode ?? 0).exception);
    } on dio.DioException catch (ex, stackTrace) {
      _printException(APIMethods.download.getName, ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex) {
      _printException(APIMethods.download.getName, ['$ex']);
      return Left(NetworkException(message: ex.toString(), statusCode: 0));
    }
  }

  void _increaseStatisticApiCall() => AppStatisticsService.to.increaseApiCalls();

  void _printResponse(String method, APIResponse response) {
    LoggerService.to.debug(message: '==> $method Method Successful Response:');
    LoggerService.to.debug(message: 'Status Code: ${response.statusCode}');
    LoggerService.to.debug(message: 'Data Message: ${response.statusMessage}');
    LoggerService.to.debug(message: 'Data Body: ${response.data}');
  }

  void _printException(String method, List<String> prints) {
    LoggerService.to.error(message: '==> $method Method Exception:');
    for (final print in prints) {
      LoggerService.to.error(message: print);
    }
  }
}
