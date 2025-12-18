// import 'dart:io';
//
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio_core.dart';
//
// import '../../core/core_functions.dart';
// import '../../localization/localizations.dart';
// import '../failures/network_exception.dart';
// import '../statistics/statistics.dart';
// import 'dio_core.dart';
//
// class DioFunctions {
//   static Dio apiCore = DioCore.to.dioCore;
//
//   static Future<Either<NetworkException, T>> get<T>({required String url, request}) async {
//     final T data;
//     try {
//       _increaseStatisticApiCall();
//       final Response result = await apiCore.get(url);
//       if (result.statusCode == 200) {
//         _printResponse('GET', result);
//         data = result.data;
//         return Right(data);
//       } else {
//         _printException('GET', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
//         return Left(_defaultLeftResponse);
//       }
//     } on DioException catch (ex, stackTrace) {
//       _printException('GET', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
//       return Left(NetworkException.handleResponse(ex, stackTrace));
//     } catch (ex, stackTrace) {
//       _printException('GET', ['$ex']);
//       rethrow;
//     }
//   }
//
//   static Future<Either<NetworkException, T>> post<T>({required String url, request}) async {
//     var dio = DioCore().dioCore;
//     final T data;
//     try {
//       _increaseStatisticApiCall();
//       final Response result = await dio.post(url);
//       if (result.statusCode == 200) {
//         _printResponse('POST', result);
//         data = result.data;
//         return Right(data);
//       }
//       _printException('POST', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
//       return Left(_defaultLeftResponse);
//     } on DioException catch (ex, stackTrace) {
//       _printException('POST', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
//       return Left(NetworkException.handleResponse(ex, stackTrace));
//     } catch (ex, stackTrace) {
//       _printException('POST', ['$ex']);
//       rethrow;
//     }
//   }
//
//   static Future<Either<NetworkException, T>> put<T>({required String url, request}) async {
//     var dio = DioCore().dioCore;
//     final T data;
//     try {
//       _increaseStatisticApiCall();
//       final Response result = await dio.put(url);
//       if (result.statusCode == 200) {
//         _printResponse('PUT', result);
//         data = result.data;
//         return Right(data);
//       }
//       _printException('PUT', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
//       return Left(_defaultLeftResponse);
//     } on DioException catch (ex, stackTrace) {
//       _printException('PUT', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
//       return Left(NetworkException.handleResponse(ex, stackTrace));
//     } catch (ex, stackTrace) {
//       _printException('PUT', ['$ex']);
//       rethrow;
//     }
//   }
//
//   static Future<Either<NetworkException, File>> download({
//     required String url,
//     required String savePath,
//     request,
//   }) async {
//     var dio = DioCore().dioCore;
//     final File data;
//     try {
//       _increaseStatisticApiCall();
//       final savePath = _getSavePath();
//       final Response result = await dio.download(url, savePath);
//       if (result.statusCode == 200) {
//         _printResponse('DOWNLOAD', result);
//         data = result.data;
//         return Right(data);
//       }
//       _printException('DOWNLOAD', ['Result Data: ${result.data}', 'Result Message: ${result.statusMessage}']);
//       return Left(_defaultLeftResponse);
//     } on DioException catch (ex, stackTrace) {
//       _printException('DOWNLOAD', ['DioException Response: ${ex.response}', 'DioException Message: ${ex.message}']);
//       return Left(NetworkException.handleResponse(ex, stackTrace));
//     } catch (ex, stackTrace) {
//       _printException('DOWNLOAD', ['$ex']);
//       rethrow;
//     }
//   }
//
//   static _increaseStatisticApiCall() => AppStatistics().increaseApiCalls();
//
//   ///TODO: Implementation
//   static Future<String> _getSavePath() async => Texts.to.general.empty;
//
//   static NetworkException get _defaultLeftResponse => NetworkExceptions.unknownException.exception;
//
//   static _printResponse(String method, Response response) {
//     appDebugPrint('==> $method Method Successful Response:');
//     appDebugPrint('Status Code: ${response.statusCode}');
//     appDebugPrint('Data Message: ${response.statusMessage}');
//     appDebugPrint('Data Body: ${response.data}');
//   }
//
//   static _printException(String method, List<String> prints) {
//     appDebugPrint('==> $method Method Exception:');
//     for (var print in prints) {
//       appDebugPrint(print);
//     }
//   }
// }
