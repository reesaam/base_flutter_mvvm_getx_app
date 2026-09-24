import 'dart:async';

import '../barrels/annotations_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_elements_barrel.dart';
import '../barrels/core_resources_barrel.dart';
import '../barrels/shared_models_barrel.dart';

// ignore: barrel_import_lints/only_barrel_imports
import 'package:device_info_plus/device_info_plus.dart';

// ignore: barrel_import_lints/only_barrel_imports
import 'package:package_info_plus/package_info_plus.dart';

// ignore: barrel_import_lints/only_barrel_imports
import 'package:sentry_flutter/sentry_flutter.dart';

/// Loads [AppDeviceInfo] for About, update checks, crash reports, and support emails.
@GetPut.service()
class AppDeviceInfoService extends CoreService {
  static AppDeviceInfoService get to => Get.find();

  /// Injected [info] / [packageInfo] / [locale] skip plugin I/O so tests stay deterministic.
  AppDeviceInfoService({AppDeviceInfo? info, PackageInfo? packageInfo, DeviceInfoPlugin? deviceInfo, Locale? locale})
    : _info = info ?? AppDeviceInfo.createEmpty(),
      _injectedInfo = info != null,
      _packageInfo = packageInfo,
      _deviceInfo = deviceInfo ?? DeviceInfoPlugin(),
      _injectedLocale = locale;

  final bool _injectedInfo;
  final DeviceInfoPlugin _deviceInfo;
  final Locale? _injectedLocale;

  PackageInfo? _packageInfo;
  AppDeviceInfo _info;
  Future<void>? _loadFuture;

  AppDeviceInfo get data => _info;
  String get appName => _info.appName;
  String get packageName => _info.packageName;
  String get version => _info.version;
  String get buildNumber => _info.buildNumber;
  String get versionWithBuild => buildNumber.isEmpty ? version : '$version+$buildNumber';
  String get os => _info.os;
  String get osVersion => _info.osVersion;
  String get deviceModel => _info.model;
  AppDevices get device => _info.device;

  Locale get locale => _injectedLocale ?? Get.locale ?? Get.deviceLocale ?? WidgetsBinding.instance.platformDispatcher.locale;
  String get localeTag => locale.toLanguageTag();
  String get summary => _info.toJson().entries.map((e) => '${e.key}: ${e.value}').join('\n');

  @override
  void onInitFunction() => unawaited(ensureReady());

  Future<void> ensureReady() => _loadFuture ??= _load();

  Future<void> _load() async {
    if (!_injectedInfo) {
      _packageInfo ??= await PackageInfo.fromPlatform();
      _info = await _readDeviceSnapshot(_deviceInfo);
    }
    _attachCrashContext();
  }

  void _attachCrashContext() {
    if (!EnvConfig.shouldInitSentry) return;
    try {
      Sentry.configureScope((scope) {
        scope.setContexts('app_device', _info.toJson());
      });
    } catch (_) {
      // Crash context must never throw if Sentry is not started.
    }
  }

  Future<AppDeviceInfo> _readDeviceSnapshot(DeviceInfoPlugin plugin) async => switch (currentAppDevice) {
    AppDevices.web || AppDevices.desktopWeb => _fromWeb(await plugin.webBrowserInfo),
    AppDevices.windows => _fromWindows(await plugin.windowsInfo),
    AppDevices.macos => _fromMacOs(await plugin.macOsInfo),
    AppDevices.linux => _fromLinux(await plugin.linuxInfo),
    AppDevices.ios => _fromIos(await plugin.iosInfo),
    AppDevices.android => _fromAndroid(await plugin.androidInfo),
    AppDevices.unknown => _assembled(device: AppDevices.unknown),
  };

  AppDeviceInfo _fromWeb(WebBrowserInfo info) => _assembled(device: currentAppDevice, os: info.browserName.name, osVersion: info.appVersion, model: info.userAgent);
  AppDeviceInfo _fromWindows(WindowsDeviceInfo info) => _assembled(device: AppDevices.windows, os: info.productName, osVersion: info.displayVersion, model: info.computerName);
  AppDeviceInfo _fromMacOs(MacOsDeviceInfo info) => _assembled(device: AppDevices.macos, os: AppDevices.macos.title, osVersion: info.osRelease, model: info.model);
  AppDeviceInfo _fromLinux(LinuxDeviceInfo info) => _assembled(device: AppDevices.linux, os: info.name, osVersion: info.version, model: info.prettyName);
  AppDeviceInfo _fromIos(IosDeviceInfo info) => _assembled(device: AppDevices.ios, os: info.systemName, osVersion: info.systemVersion, model: info.utsname.machine);
  AppDeviceInfo _fromAndroid(AndroidDeviceInfo info) => _assembled(
    device: AppDevices.android,
    os: AppDevices.android.title,
    osVersion: info.version.release,
    model: '${info.manufacturer} ${info.model}',
  );

  AppDeviceInfo _assembled({required AppDevices device, String? os, String? osVersion, String? model}) => AppDeviceInfo(
    appName: _packageInfo?.appName ?? AppInfo.appName,
    packageName: _packageInfo?.packageName ?? '',
    version: _packageInfo?.version ?? AppInfo.currentVersion.version,
    buildNumber: _packageInfo?.buildNumber ?? '',
    device: device,
    os: os ?? device.title,
    osVersion: osVersion ?? '',
    model: model ?? '',
    locale: localeTag,
    environment: EnvConfig.environment,
    apiHost: EnvConfig.apiHost,
    isProduction: EnvConfig.isProduction,
  );
}
