import 'package:base_flutter_mvvm_getx_app/barrels/core_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_resources_barrel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EnvConfig', () {
    test('defaults to development environment', () {
      expect(EnvConfig.environment, Environment.development);
    });

    test('resolvedBaseUrl falls back to environment baseUrl', () {
      expect(EnvConfig.resolvedBaseUrl, isNotEmpty);
      expect(EnvConfig.resolvedBaseUrl, EnvConfig.environment.baseUrl);
    });

    test('shouldInitSentry is false without DSN/enable flag', () {
      expect(EnvConfig.shouldInitSentry, isFalse);
    });

    test('authDemoMode defaults to true for template', () {
      expect(EnvConfig.authDemoMode, isTrue);
    });
  });
}
