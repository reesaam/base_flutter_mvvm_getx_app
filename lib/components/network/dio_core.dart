import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../core/core_elements/core_component.dart';
import '../../core/core_functions.dart';
import '../../core/core_resources/defaults.dart';
import '../../core/core_resources/defined_types.dart';
import '../../core/core_resources/texts.dart';
import '../statistics/statistics.dart';
import 'api_methods.dart';

export 'package:dio/dio.dart';
export 'api_methods.dart';
export 'api_response_status.dart';

typedef APIResponse = dio.Response;

@GetPut.component()
class DioCore extends CoreComponent {
  static DioCore get to => Get.find();

  dio.Dio get dioCore => dio.Dio();

  Future<BaseAPIResponse<T>> callMethod<T>({
    required APIMethods method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final dio.Options options = dio.Options(
      method: method.getName,
      receiveTimeout: AppDefaults.connectionTimeOut,
      sendTimeout: AppDefaults.connectionTimeOut,
      contentType: AppTexts.dioHeaderContentTypeData,
      headers: {"Content-Type": "application/json"},
    );
    _increaseStatisticApiCall();
    final result = await dioCore.request(
      url,
      queryParameters: queryParameters,
      options: options,
      data: data,
    );
    if (APIResponseStatus.values.find(result.statusCode ?? 0).isSuccess == true) {
      // _printResponse(method.getName, result.data);
      return Right(result.data);
    } else {
      _printException(method.getName,
          ['Result Data: ${result.data} (${result.statusCode})', 'Result Message: ${result.statusMessage}']);
      return Left(APIResponseStatus.values.find(result.statusCode ?? 0).exception);
    }
  }

  Future<BaseAPIResponse<File>> download({
    required String url,
    required String savePath,
    request,
  }) async {
    final File data;
    try {
      _increaseStatisticApiCall();
      final savePath = _getSavePath();
      final APIResponse result = await dioCore.download(url, savePath);
      if (result.statusCode == 200) {
        _printResponse('DOWNLOAD', result);
        data = result.data;
        return Right(data);
      }
      _printException(
          APIMethods.download.getName, ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
      return Left(APIResponseStatus.values.find(result.statusCode ?? 0).exception);
    } on dio.DioException catch (ex, stackTrace) {
      _printException(APIMethods.download.getName,
          ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      _printException(APIMethods.download.getName, ['$ex']);
      rethrow;
    }
  }

  static _increaseStatisticApiCall() => AppStatistics.to.increaseApiCalls();

  ///TODO: Implementation
  static Future<String> _getSavePath() async => '';

  static _printResponse(String method, APIResponse response) {
    appDebugPrint('==> $method Method Successful Response:');
    appDebugPrint('Status Code: ${response.statusCode}');
    appDebugPrint('Data Message: ${response.statusMessage}');
    appDebugPrint('Data Body: ${response.data}');
  }

  static _printException(String method, List<String> prints) {
    appDebugPrint('==> $method Method Exception:');
    for (var print in prints) {
      appDebugPrint(print);
    }
  }
}
