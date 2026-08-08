import '../../core/core_resources/core_enums.dart';

/// Compile-time environment via `--dart-define`.
///
/// Example:
/// ```
/// flutter run \
///   --dart-define=ENV=production \
///   --dart-define=BASE_URL=api.example.com \
///   --dart-define=API_SUBDOMAIN=www \
///   --dart-define=ENABLE_SENTRY=true \
///   --dart-define=SENTRY_DSN=https://...@sentry.io/...
/// ```
class EnvConfig {
  const EnvConfig._();

  static const String envName = String.fromEnvironment('ENV', defaultValue: 'development');
  static const String baseUrlOverride = String.fromEnvironment('BASE_URL', defaultValue: '');
  static const String apiSubDomainOverride = String.fromEnvironment('API_SUBDOMAIN', defaultValue: '');
  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN', defaultValue: '');
  static const bool enableSentry = bool.fromEnvironment('ENABLE_SENTRY', defaultValue: false);
  static const String secureStoragePassword = String.fromEnvironment(
    'SECURE_STORAGE_PASSWORD',
    defaultValue: 'dev_only_change_me',
  );

  /// When true, auth accepts any non-empty credentials without calling the API.
  static const bool authDemoMode = bool.fromEnvironment('AUTH_DEMO_MODE', defaultValue: true);

  static Environment get environment => switch (envName.toLowerCase()) {
        'production' || 'prod' => Environment.production,
        'stage' || 'staging' => Environment.stage,
        _ => Environment.development,
      };

  static String get resolvedBaseUrl {
    if (baseUrlOverride.isNotEmpty) return baseUrlOverride;
    return environment.baseUrl;
  }

  static String? get resolvedSubDomain {
    if (apiSubDomainOverride.isNotEmpty) return apiSubDomainOverride;
    return environment.subDomain;
  }

  static bool get isProduction => environment == Environment.production;
  static bool get shouldInitSentry => enableSentry && sentryDsn.isNotEmpty;
}
