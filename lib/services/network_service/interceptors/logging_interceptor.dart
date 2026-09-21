import 'package:dio/dio.dart' as dio;

import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';

/// Debug-only request/response logging interceptor.
class LoggingInterceptor extends dio.Interceptor {
  @override
  void onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    if (!CoreFlags.isRelease) {
      appDebugPrint('HTTP → ${options.method} ${options.uri}');
    }
    handler.next(options);
  }

  @override
  void onResponse(dio.Response response, dio.ResponseInterceptorHandler handler) {
    if (!CoreFlags.isRelease) {
      appDebugPrint('HTTP ← ${response.statusCode} ${response.requestOptions.uri}');
    }
    handler.next(response);
  }

  @override
  void onError(dio.DioException err, dio.ErrorInterceptorHandler handler) {
    if (!CoreFlags.isRelease) {
      appDebugPrint('HTTP ✕ ${err.response?.statusCode} ${err.requestOptions.uri} · ${err.message}');
    }
    handler.next(err);
  }
}
