import 'dart:io';

import 'package:dio/dio.dart';

import '../../barrels/core_resources_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/services_barrel.dart';
import '../../barrels/extensions_barrel.dart';

class DioFunctions {
  static Dio apiCore = DioCore.to.dioCore;

  static Future<BaseAPIResponse<T>> get<T>({required String url, request}) async {
    final T data;
    try {
      _increaseStatisticApiCall();
      final Response result = await apiCore.get(url);
      if (result.statusCode == 200) {
        _printResponse('GET', result);
        data = result.data;
        return Right(data);
      } else {
        _printException('GET', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
        return Left(_defaultLeftResponse);
      }
    } on DioException catch (ex, stackTrace) {
      _printException('GET', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      _printException('GET', ['$ex']);
      rethrow;
    }
  }

  static Future<BaseAPIResponse<T>> post<T>({required String url, request}) async {
    var dio = DioCore().dioCore;
    final T data;
    try {
      _increaseStatisticApiCall();
      final Response result = await dio.post(url);
      if (result.statusCode == 200) {
        _printResponse('POST', result);
        data = result.data;
        return Right(data);
      }
      _printException('POST', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
      return Left(_defaultLeftResponse);
    } on DioException catch (ex, stackTrace) {
      _printException('POST', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      _printException('POST', ['$ex']);
      rethrow;
    }
  }

  static Future<BaseAPIResponse<T>> put<T>({required String url, request}) async {
    var dio = DioCore().dioCore;
    final T data;
    try {
      _increaseStatisticApiCall();
      final Response result = await dio.put(url);
      if (result.statusCode == 200) {
        _printResponse('PUT', result);
        data = result.data;
        return Right(data);
      }
      _printException('PUT', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
      return Left(_defaultLeftResponse);
    } on DioException catch (ex, stackTrace) {
      _printException('PUT', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      _printException('PUT', ['$ex']);
      rethrow;
    }
  }

  static Future<BaseAPIResponse<File>> download({required String url, required String savePath, request}) async {
    var dio = DioCore().dioCore;
    final File data;
    try {
      _increaseStatisticApiCall();
      final savePath = _getSavePath();
      final Response result = await dio.download(url, savePath);
      if (result.statusCode == 200) {
        _printResponse('DOWNLOAD', result);
        data = result.data;
        return Right(data);
      }
      _printException('DOWNLOAD', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
      return Left(_defaultLeftResponse);
    } on DioException catch (ex, stackTrace) {
      _printException('DOWNLOAD', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex, stackTrace));
    } catch (ex, stackTrace) {
      _printException('DOWNLOAD', ['$ex']);
      rethrow;
    }
  }

  static _increaseStatisticApiCall() => AppStatisticsService.to.increaseApiCalls();

  ///TODO: Implementation
  static Future<String> _getSavePath() async => Texts.to.general.empty;

  static NetworkException get _defaultLeftResponse => ResponseStatusAPI.unknownException.exception;

  static _printResponse(String method, Response response) {
    LoggerService.to.devLog(message: '==> $method Method Successful Response:');
    LoggerService.to.devLog(message: 'Status Code: ${response.statusCode}');
    LoggerService.to.devLog(message: 'Data Message: ${response.statusMessage}');
    LoggerService.to.devLog(message: 'Data Body: ${response.data}');
  }

  static _printException(String method, List<String> prints) {
    LoggerService.to.devLog(message: '==> $method Method Exception:');
    for (var print in prints) {
      LoggerService.to.devLog(message: print);
    }
  }
}
