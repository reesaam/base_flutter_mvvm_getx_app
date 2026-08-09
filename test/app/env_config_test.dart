import 'package:base_flutter_mvvm_getx_app/barrels/core_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_resources_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/core/flavors/environment_variables.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EnvConfig / EnvironmentVariables', () {
    test('environment name follows AppInfo.environment', () {
      expect(EnvConfig.environment, AppInfo.environment);
      expect(EnvConfig.envName, AppInfo.environment.name);
    });

    test('settings come from EnvironmentVariables.current', () {
      expect(EnvConfig.vars, same(EnvironmentVariables.current));
      expect(EnvConfig.baseUrl, isNotEmpty);
      expect(EnvConfig.subDomain, isNotEmpty);
      expect(EnvConfig.apiHost, '${EnvConfig.subDomain}.${EnvConfig.baseUrl}');
    });

    test('Environment enum has no embedded settings', () {
      expect(Environment.values.map((Environment e) => e.name).toList(), [
        'development',
        'stage',
        'production',
      ]);
    });

    test('shouldInitSentry is false without DSN/enable flag', () {
      expect(EnvConfig.shouldInitSentry, isFalse);
    });

    test('authDemoMode defaults to true for template', () {
      expect(EnvConfig.authDemoMode, isTrue);
    });
  });
}
