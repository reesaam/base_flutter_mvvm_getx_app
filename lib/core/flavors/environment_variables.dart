/// Pick the active **name** via [AppInfo.environment]. Put all env-dependent
/// values in `config/envs/*.json` (loaded at build/run time).
class EnvironmentVariables {
  const EnvironmentVariables({
    required this.baseUrl,
    required this.subDomain,
    required this.sentryDsn,
    required this.enableSentry,
    required this.secureStoragePassword,
    required this.authDemoMode,
  });

  /// Host only, e.g. `resam.site` (no scheme).
  final String baseUrl;

  /// API subdomain, e.g. `www` / `stage`.
  final String subDomain;

  final String sentryDsn;
  final bool enableSentry;
  final String secureStoragePassword;

  /// When true, auth accepts any non-empty credentials without calling the API.
  final bool authDemoMode;

  /// Values baked in from the active dart-define file (or defaults).
  static const EnvironmentVariables current = EnvironmentVariables(
    baseUrl: String.fromEnvironment('BASE_URL', defaultValue: 'resam.site'),
    subDomain: String.fromEnvironment('API_SUBDOMAIN', defaultValue: 'www'),
    sentryDsn: String.fromEnvironment('SENTRY_DSN', defaultValue: ''),
    enableSentry: bool.fromEnvironment('ENABLE_SENTRY', defaultValue: false),
    secureStoragePassword: String.fromEnvironment('SECURE_STORAGE_PASSWORD', defaultValue: 'dev_only_change_me'),
    authDemoMode: bool.fromEnvironment('AUTH_DEMO_MODE', defaultValue: true),
  );

  String get apiHost => '$subDomain.$baseUrl';

  bool get shouldInitSentry => enableSentry && sentryDsn.isNotEmpty;
}
