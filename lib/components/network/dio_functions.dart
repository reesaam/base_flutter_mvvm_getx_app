import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../statistics/statistics.dart';
import 'dio.dart';
import '../failures/network_exception.dart';

class DioFunctions {
  static Future<Either<NetworkException, T>> get<T>({required String url, request}) async {
    var dio = DioCore().dio;
    final T data;
    try {
      _increaseStatisticApiCall();
      final Response result = await dio.get(url);
      if (result.statusCode == 200) {
        _printResponse('GET', result);
        data = result.data;
        return Right(data);
      }
      _printException('GET', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
      return Left(NetworkException.handleResponse(result));
    } on DioException catch (ex) {
      _printException('GET', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      _printException('GET', ['$ex']);
      return Left(NetworkException.parsingDataException());
    }
  }

  static Future<Either<NetworkException, T>> post<T>({required String url, request}) async {
    var dio = DioCore().dio;
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
      return Left(NetworkException.handleResponse(result));
    } on DioException catch (ex) {
      _printException('POST', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      _printException('POST', ['$ex']);
      return Left(NetworkException.parsingDataException());
    }
  }

  static Future<Either<NetworkException, T>> put<T>({required String url, request}) async {
    var dio = DioCore().dio;
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
      return Left(NetworkException.handleResponse(result));
    } on DioException catch (ex) {
      _printException('PUT', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      _printException('PUT', ['$ex']);
      return Left(NetworkException.parsingDataException());
    }
  }

  static Future<Either<NetworkException, File>> download({required String url, required String savePath, request}) async {
    var dio = DioCore().dio;
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
      return Left(NetworkException.handleResponse(result));
    } on DioException catch (ex) {
      _printException('DOWNLOAD', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
      return Left(NetworkException.handleResponse(ex.response));
    } catch (ex) {
      _printException('DOWNLOAD', ['$ex']);
      return Left(NetworkException.parsingDataException());
    }
  }

  static _increaseStatisticApiCall() => AppStatistics().increaseApiCalls();

  ///TODO: Implementation
  static Future<String> _getSavePath() async => Texts.to.empty;

  static _printResponse(String method, Response response) {
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
