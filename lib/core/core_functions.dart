import 'dart:io';

import '../barrels/services_barrel.dart';
import '../barrels/core_resources_barrel.dart';
import '../barrels/localization_barrel.dart';
import '../barrels/shared_models_barrel.dart';
import '../barrels/ui_kit_barrel.dart';

// ignore: barrel_import_lints/only_barrel_imports
import 'package:flutter/foundation.dart';

bool get kIsDesktop => !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

bool get kIsDesktopWeb =>
    kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux);

bool get kisMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

/// Resolves [AppDevices] from [kIsWeb] / [kIsDesktop] / [kIsDesktopWeb] / [kisMobile].
AppDevices get currentAppDevice {
  if (kIsDesktopWeb) return AppDevices.desktopWeb;
  if (kIsWeb) return AppDevices.web;
  if (kisMobile) return Platform.isIOS ? AppDevices.ios : AppDevices.android;
  if (kIsDesktop) {
    if (Platform.isWindows) return AppDevices.windows;
    if (Platform.isMacOS) return AppDevices.macos;
    return AppDevices.linux;
  }
  return AppDevices.unknown;
}

popPage<T>() {
  Get.back<T>();
}

void nullFunction() {}

void clearAppData() async {
  final response = await AppStorageService.to.clearStorage();
  response.fold((l) => AppExceptionsDialog.show(exception: l), (r) => AppSnackBar.show());
}

Future<bool?> saveAppData({
  AppVersionsList? appVersionData,
  AppDataVersions? appDataVersionData,
  AppSettingData? appSettingData,
  AppStatisticsData? appStatisticsData,
}) async {
  AppData? loadedData = await loadAppData();
  AppData appData = AppData(
    appVersions: appVersionData ?? loadedData?.appVersions,
    dataVersion: appDataVersionData ?? loadedData?.dataVersion,
    settings: appSettingData ?? loadedData?.settings,
    statisticsData: appStatisticsData ?? loadedData?.statisticsData,
  );
  final result = await AppStorageService.to
      .saveAppData(appData: appData)
      .then((value) => value.fold((l) => AppExceptionsDialog.show(exception: l), (r) => r));
  return result;
}

Future<AppData?> loadAppData() async {
  AppData? appData = await AppStorageService.to.loadAppData().then((value) => value.fold((l) => AppExceptionsDialog.show(exception: l), (r) => r));
  return appData;
}

void printAllData({bool? detailsIncluded}) async {
  AppData? appData = await loadAppData();
  AppStorageService.to.printData(appData: appData, detailsIncluded: detailsIncluded);
}

noInternetConnectionSnackBar() => AppSnackBar.show(message: Texts.to.network.connection.internetNotAvailable);

showLoadingDialog({bool? isDismissible}) => AppAlertDialogs.to.withoutButton(widget: AppProgressIndicator.linear(), dismissible: isDismissible);

appExitDialog() => AppAlertDialogs.to.withTwoButtons(
  buttonText1: Texts.to.general.ok,
  buttonText2: Texts.to.general.cancel,
  title: Texts.to.general.appExit,
  text: Texts.to.dialogs.general.areYouSure,
  onTapButton1: appExit(),
  onTapButton2: popPage,
  dismissible: true,
);

appReload({AppPageDetail? bootPage}) async {
  showLoadingDialog();
  LoggerService.to.info(message: 'App Reload Triggered');
  Get.reloadAll(force: true);
}

appReset() {
  LoggerService.to.info(message: 'App Reset Triggered');
  Get.reset();
}

appRestart() {
  LoggerService.to.info(message: 'App Restart Triggered');
  // kIsWeb ? RestartWeb().restart('webOrigin') : Restart.restartApp();
}

appExit() {
  LoggerService.to.info(message: 'App Exit Triggered');
  exit(0);
}
