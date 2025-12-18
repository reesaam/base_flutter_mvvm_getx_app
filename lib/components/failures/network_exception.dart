import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import 'general_exception.dart';
import 'network_exceptions.dart';

export 'network_exceptions.dart';

class NetworkException implements GeneralException {
  NetworkException({this.message, this.statusCode});

  @override
  final String? message;
  @override
  final int? statusCode;

  static NetworkException handleResponse(dio.DioException ex, StackTrace? stacktrace) {
    final exception = NetworkExceptions.values.firstWhereOrNull((e) => e.statusCode == ex.response?.statusCode);
    throw exception != null ? exception.exception : NetworkExceptions.unknownException.exception;
  }
}
