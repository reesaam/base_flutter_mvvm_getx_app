import 'dart:async';

import 'package:dio/dio.dart' as dio;

import '../../../barrels/core_barrel.dart';
// ignore: barrel_import_lints/only_barrel_imports
import '../../../features/auth/data/auth_session.dart';

/// Attaches Bearer token from [AuthSession] unless skipped via header.
class AuthInterceptor extends dio.Interceptor {
  static const skipAuthHeader = 'X-Skip-Auth';

  @override
  void onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    final skip = options.headers.remove(skipAuthHeader) == 'true';
    if (!skip && Get.isRegistered<AuthSession>()) {
      final token = AuthSession.to.accessToken;
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(dio.DioException err, dio.ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 && Get.isRegistered<AuthSession>()) {
      appLogPrint('AuthInterceptor: unauthorized response');
      unawaited(AuthSession.to.handleUnauthorized());
    }
    handler.next(err);
  }
}
