import 'package:dio/dio.dart' as dio;

import '../../barrels/extensions_barrel.dart';
import '../network/api_response_status.dart';
import 'general_exception.dart';

export '../network/api_response_status.dart';
export 'general_exception.dart';
export '../../core/extensions/api_extensions/extension_api_response_status.dart';

class NetworkException implements GeneralException {
  NetworkException({this.message, this.statusCode});

  @override
  final String? message;
  @override
  final int? statusCode;

  static NetworkException handleResponse(dio.DioException ex, StackTrace? stacktrace) {
    final status = APIResponseStatus.values.find(ex.response?.statusCode ?? 0);
    String message;
    try {
      message = status.message;
    } catch (_) {
      message = status.name;
    }
    return NetworkException(message: message, statusCode: ex.response?.statusCode ?? status.statusCode);
  }
}
