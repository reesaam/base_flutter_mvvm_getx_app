import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/core_resources_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/barrels/shared_models_barrel.dart';
import 'package:base_flutter_mvvm_getx_app/services/device_info_service.dart';

void main() {
  late AppDeviceInfoService service;
  late AppDeviceInfo info;

  setUp(() {
    Get.testMode = true;
    Get.reset();
    info = AppDeviceInfo(
      appName: 'Test App',
      packageName: 'site.resam.test',
      version: '1.2.3',
      buildNumber: '45',
      device: AppDevices.windows,
      os: 'Windows',
      osVersion: '11',
      model: 'LOQ',
      locale: 'en-US',
      environment: EnvConfig.environment,
      apiHost: EnvConfig.apiHost,
      isProduction: EnvConfig.isProduction,
    );
    service = AppDeviceInfoService(
      info: info,
      packageInfo: PackageInfo(appName: 'Test App', packageName: 'site.resam.test', version: '1.2.3', buildNumber: '45'),
      locale: const Locale('en', 'US'),
    );
    Get.put(service);
  });

  tearDown(Get.reset);

  test('AppDeviceInfoService.to resolves the registered service', () {
    expect(AppDeviceInfoService.to, same(service));
  });

  test('exposes the model and env fields from EnvConfig', () async {
    await service.ensureReady();

    expect(service.data, info);
    expect(service.version, '1.2.3');
    expect(service.buildNumber, '45');
    expect(service.versionWithBuild, '1.2.3+45');
    expect(service.os, 'Windows');
    expect(service.deviceModel, 'LOQ');
    expect(service.device, AppDevices.windows);
    expect(service.data.environment, EnvConfig.environment);
    expect(service.data.apiHost, EnvConfig.apiHost);
    expect(service.data.isProduction, EnvConfig.isProduction);
  });

  test('createEmpty stamps flavor data from EnvConfig', () {
    final empty = AppDeviceInfo.createEmpty();
    expect(empty.environment, EnvConfig.environment);
    expect(empty.apiHost, EnvConfig.apiHost);
    expect(empty.isProduction, EnvConfig.isProduction);
    expect(empty.version, AppInfo.currentVersion.version);
    expect(empty.device, AppDevices.unknown);
  });

  test('summary is built from the model json', () async {
    await service.ensureReady();
    expect(service.summary, contains('version: 1.2.3'));
    expect(service.summary, contains('model: LOQ'));
    expect(service.data.toJson()['device'], AppDevices.windows.name);
  });
}
