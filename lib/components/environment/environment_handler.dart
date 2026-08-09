import '../../app/flavors/env_config.dart';
import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

@GetPut.component()
class EnvironmentHandler extends CoreController {
  static Environment current = EnvConfig.environment;

  static void applyEnvConfig() => current = EnvConfig.environment;

  static String get baseUrl => EnvConfig.resolvedBaseUrl;
  static String? get subDomain => EnvConfig.resolvedSubDomain;
}

/// Global Environment Variable
Environment get currentEnvironment => EnvironmentHandler.current;
