import 'dart:io';

import 'package:dio/dio.dart' as dio;

import '../../barrels/annotations_barrel.dart';
import '../../barrels/components_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

export 'api_methods.dart';
export 'api_response_status.dart';

typedef APIResponse = dio.Response;

@GetPut.component()
class DioCore extends CoreComponent {
  static DioCore get to => Get.find();

  late final dio.Dio client;

  @override
  void onInit() {
    client = dio.Dio(
      dio.BaseOptions(
        connectTimeout: AppDefaults.timeOutConnection,
        receiveTimeout: AppDefaults.timeOutConnection,
        sendTimeout: AppDefaults.timeOutConnection,
        contentType: AppTexts.dioHeaderContentTypeData,
        headers: const {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );
    client.interceptors.addAll([RetryInterceptor(client), LoggingInterceptor()]);
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
        headers: {'Content-Type': 'application/json', if (headers != null) ...headers},
      );
      _increaseStatisticApiCall();
      final result = await client.request<dynamic>(url, queryParameters: queryParameters, options: options, data: data);
      if (APIResponseStatus.values.find(result.statusCode ?? 0).isSuccess == true) {
        return Right(result.data as T);
      }
      _printException(method.getName, ['Result Data: ${result.data} (${result.statusCode})', 'Result Message: ${result.statusMessage}']);
      return Left(APIResponseStatus.values.find(result.statusCode ?? 0).exception);
    } on dio.DioException catch (ex, stackTrace) {
      _printException(method.getName, ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex) {
      _printException(method.getName, ['$ex']);
      return Left(NetworkException(message: ex.toString(), statusCode: 0));
    }
  }

  Future<BaseAPIResponse<File>> download({required String url, required String savePath}) async {
    try {
      _increaseStatisticApiCall();
      final APIResponse result = await client.download(url, savePath);
      if (result.statusCode == 200) {
        _printResponse('DOWNLOAD', result);
        return Right(File(savePath));
      }
      _printException(APIMethods.download.getName, ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
      return Left(APIResponseStatus.values.find(result.statusCode ?? 0).exception);
    } on dio.DioException catch (ex, stackTrace) {
      _printException(APIMethods.download.getName, ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex) {
      _printException(APIMethods.download.getName, ['$ex']);
      return Left(NetworkException(message: ex.toString(), statusCode: 0));
    }
  }

  static void _increaseStatisticApiCall() => AppStatistics.to.increaseApiCalls();

  static void _printResponse(String method, APIResponse response) {
    appDebugPrint('==> $method Method Successful Response:');
    appDebugPrint('Status Code: ${response.statusCode}');
    appDebugPrint('Data Message: ${response.statusMessage}');
    appDebugPrint('Data Body: ${response.data}');
  }

  static void _printException(String method, List<String> prints) {
    appDebugPrint('==> $method Method Exception:');
    for (final print in prints) {
      appDebugPrint(print);
    }
  }
}
