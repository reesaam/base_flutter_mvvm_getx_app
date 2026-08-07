import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';

@GetPut.component()
class EnvironmentHandler extends CoreController {
  static Environment current = AppInfo.environment;

  static get baseUrl => current.baseUrl;
  static get subDomain => current.subDomain;
}

/// Global Environment Variable
Environment get currentEnvironment => EnvironmentHandler.current;