import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import 'environment_variables.dart';

/// Access to [AppInfo.environment] (name) and [EnvironmentVariables.current] (settings).
///
/// Change the env **name** in `lib/core/core_info/app_info.dart`.
/// Change env **settings** in `config/envs/*.json` + `--dart-define-from-file=...`.
class EnvConfig {
  const EnvConfig._();

  /// Active environment name — from [AppInfo.environment]. Copied onto [AppDeviceInfo].
  static Environment get environment => AppInfo.environment;

  static String get envName => environment.name;

  /// All environment-dependent settings from dart-defines.
  static EnvironmentVariables get vars => EnvironmentVariables.current;

  static String get baseUrl => vars.baseUrl;
  static String get subDomain => vars.subDomain;
  static String get apiHost => vars.apiHost;
  static String get apiBaseUrl => 'https://$apiHost/${APIVersions.v1.getValue}/';
  static String get sentryDsn => vars.sentryDsn;
  static bool get enableSentry => vars.enableSentry;
  static String get secureStoragePassword => vars.secureStoragePassword;
  static bool get authDemoMode => vars.authDemoMode;

  /// Flavor flag copied onto [AppDeviceInfo].
  static bool get isProduction => environment == Environment.production;
  static bool get shouldInitSentry => vars.shouldInitSentry;
}
