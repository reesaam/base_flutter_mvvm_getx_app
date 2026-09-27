import 'package:dio/dio.dart' as dio;

import '../../barrels/components_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/services_barrel.dart';

class NetworkException implements GeneralException {
  NetworkException({this.message, this.statusCode, this.stackTrace});

  @override
  final String? message;
  @override
  final int? statusCode;
  @override
  StackTrace? stackTrace;

  static NetworkException handleResponse(dio.DioException ex, StackTrace? stacktrace) {
    final status =
        ResponseStatusAPI.values.firstWhereOrNull((element) => element.statusCode == ex.response?.statusCode) ?? ResponseStatusAPI.unknownException;
    try {
      return status.exception(stackTrace: stacktrace);
    } catch (_) {
      return NetworkException(message: status.message, statusCode: ex.response?.statusCode ?? status.statusCode, stackTrace: stacktrace);
    }
  }
}
