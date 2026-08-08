import 'dart:convert';

import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/components_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../models/auth_models.dart';

/// Persists auth session and exposes reactive auth state.
@GetPut.component()
class AuthSession extends CoreComponent {
  static AuthSession get to => Get.find();

  final isAuthenticated = false.obs;
  final currentUser = Rxn<AuthUser>();

  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Future<void> restoreSession() async {
    final tokenResult = await SecureStorageModule.to.read<String>(AppStorageKeys.accessToken);
    final refreshResult = await SecureStorageModule.to.read<String>(AppStorageKeys.refreshToken);
    final userResult = await SecureStorageModule.to.read<String>(AppStorageKeys.authUser);

    _accessToken = tokenResult.fold((_) => null, (r) => r);
    _refreshToken = refreshResult.fold((_) => null, (r) => r);

    userResult.fold((_) {}, (raw) {
      if (raw == null || raw.isEmpty) return;
      try {
        currentUser.value = AuthUser.fromJson(jsonDecode(raw) as Map<String, dynamic>);
      } catch (_) {
        currentUser.value = null;
      }
    });

    isAuthenticated.value = _accessToken != null && _accessToken!.isNotEmpty;
    if (isAuthenticated.value && currentUser.value != null) {
      await CrashReporter.setUser(
        id: currentUser.value!.id,
        email: currentUser.value!.email,
        username: currentUser.value!.displayName,
      );
    }
  }

  Future<void> persistSession({
    required AuthTokens tokens,
    required AuthUser user,
  }) async {
    _accessToken = tokens.accessToken;
    _refreshToken = tokens.refreshToken;
    currentUser.value = user;
    isAuthenticated.value = true;

    await SecureStorageModule.to.write(key: AppStorageKeys.accessToken, value: tokens.accessToken);
    if (tokens.refreshToken != null) {
      await SecureStorageModule.to.write(key: AppStorageKeys.refreshToken, value: tokens.refreshToken!);
    }
    await SecureStorageModule.to.write(key: AppStorageKeys.authUser, value: jsonEncode(user.toJson()));
    await CrashReporter.setUser(id: user.id, email: user.email, username: user.displayName);
    await CrashReporter.addBreadcrumb('auth.login', category: 'auth');
  }

  Future<void> clearSession() async {
    _accessToken = null;
    _refreshToken = null;
    currentUser.value = null;
    isAuthenticated.value = false;

    await SecureStorageModule.to.remove(AppStorageKeys.accessToken);
    await SecureStorageModule.to.remove(AppStorageKeys.refreshToken);
    await SecureStorageModule.to.remove(AppStorageKeys.authUser);
    await CrashReporter.clearUser();
    await CrashReporter.addBreadcrumb('auth.logout', category: 'auth');
  }

  Future<void> handleUnauthorized() async {
    await clearSession();
    if (Get.currentRoute != AppPages.login.pageRoute) {
      goToPage(AppPages.login, popAll: true);
    }
  }

  /// Demo helper used when auth demo mode is enabled.
  AuthLoginResult createDemoSession({required String email}) => AuthLoginResult(
        tokens: AuthTokens(
          accessToken: 'demo_access_${DateTime.now().millisecondsSinceEpoch}',
          refreshToken: 'demo_refresh_${DateTime.now().millisecondsSinceEpoch}',
          expiresAt: DateTime.now().add(const Duration(days: 7)),
        ),
        user: AuthUser(
          id: 'demo-user',
          email: email,
          displayName: email.split('@').first,
        ),
      );
}
