import '../../../../barrels/annotations_barrel.dart';
import '../../../../barrels/core_barrel.dart';
import '../../../../barrels/core_resources_barrel.dart';

part 'app_device_info.freezed.dart';
part 'app_device_info.g.dart';

@FreezedCustom.model
abstract class AppDeviceInfo with _$AppDeviceInfo {
  const factory AppDeviceInfo({
    required final String appName,
    required final String packageName,
    required final String version,
    required final String buildNumber,
    required final AppDevices device,
    required final String os,
    required final String osVersion,
    required final String model,
    required final String locale,
    required final Environment environment,
    required final String apiHost,
    required final bool isProduction,
  }) = _AppDeviceInfo;

  factory AppDeviceInfo.fromJson(Map<String, dynamic> json) => _$AppDeviceInfoFromJson(json);

  /// Flavor fields come from [EnvConfig]; package/device fields stay empty until the service loads.
  factory AppDeviceInfo.createEmpty() => AppDeviceInfo(
    appName: AppInfo.appName,
    packageName: '',
    version: AppInfo.currentVersion.version,
    buildNumber: '',
    device: AppDevices.unknown,
    os: '',
    osVersion: '',
    model: '',
    locale: '',
    environment: EnvConfig.environment,
    apiHost: EnvConfig.apiHost,
    isProduction: EnvConfig.isProduction,
  );
}

@FreezedCustom.modelList
abstract class AppDeviceInfoList with _$AppDeviceInfoList {
  factory AppDeviceInfoList({@Default(<AppDeviceInfo>[]) List<AppDeviceInfo> deviceInfoList}) = _AppDeviceInfoList;

  factory AppDeviceInfoList.fromJson(Map<String, dynamic> json) => _$AppDeviceInfoListFromJson(json);
}
