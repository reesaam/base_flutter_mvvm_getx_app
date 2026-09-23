import 'package:dio/dio.dart' as dio;

import '../../barrels/extensions_barrel.dart';
import '../../barrels/services_barrel.dart';

class NetworkException implements GeneralException {
  NetworkException({this.message, this.statusCode});

  @override
  final String? message;
  @override
  final int? statusCode;

  static NetworkException handleResponse(dio.DioException ex, StackTrace? stacktrace) {
    final status = ResponseStatusAPI.values.find(ex.response?.statusCode ?? 0);
    String message;
    try {
      message = status.message;
    } catch (_) {
      message = status.name;
    }
    return NetworkException(message: message, statusCode: ex.response?.statusCode ?? status.statusCode);
  }
}
