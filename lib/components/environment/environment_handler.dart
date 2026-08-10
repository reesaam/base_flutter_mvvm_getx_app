import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

// ignore: barrel_import_lints/only_barrel_imports
import '../../core/flavors/environment_variables.dart';

@GetPut.component()
class EnvironmentHandler extends CoreController {
  static Environment get current => AppInfo.environment;
  static EnvironmentVariables get settings => EnvConfig.vars;

  static void applyEnvConfig() {
    // Source of truth: [AppInfo.environment] + [EnvironmentVariables.current].
  }

  static String get baseUrl => settings.baseUrl;
  static String get subDomain => settings.subDomain;
  static String get apiHost => settings.apiHost;
}

/// Global environment name.
Environment get currentEnvironment => EnvironmentHandler.current;

/// Global environment settings (URLs, flags, secrets for this build).
EnvironmentVariables get currentEnvironmentSettings => EnvironmentHandler.settings;
