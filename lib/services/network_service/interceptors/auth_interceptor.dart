import 'package:dio/dio.dart' as dio;

import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/services_barrel.dart';

/// Attaches `Authorization: Bearer <accessToken>` unless [skipAuth] is set.
class AuthInterceptor extends dio.Interceptor {
  static const skipAuthExtraKey = 'skip_auth';

  static bool shouldSkip(dio.RequestOptions options) {
    if (options.extra[skipAuthExtraKey] == true) return true;
    final header = options.headers[AppTexts.dioHeaderSkipAuth]?.toString().toLowerCase();
    return header == 'true';
  }

  @override
  Future<void> onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    final skipAuth = shouldSkip(options);
    options.headers.remove(AppTexts.dioHeaderSkipAuth);

    if (!skipAuth && Get.isRegistered<SecureStorageService>()) {
      final tokenResult = await SecureStorageService.to.read<String>(AppStorageKeys.accessToken);
      tokenResult.fold((_) {}, (token) {
        if (token != null && token.isNotEmpty) {
          options.headers[AppTexts.dioHeaderAuthorization] = 'Bearer $token';
        }
      });
    }

    handler.next(options);
  }
}
