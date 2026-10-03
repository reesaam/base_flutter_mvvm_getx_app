import 'dart:io';

import '../barrels/components_barrel.dart';
import '../barrels/services_barrel.dart';
import '../barrels/core_resources_barrel.dart';
import '../barrels/localization_barrel.dart';
import '../barrels/shared_models_barrel.dart';
import '../barrels/shared_repositories_barrel.dart';
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
  final response = await AppDataRepository.to.clearAppData();
  response.fold((l) => _exceptionDialog(l), (r) => AppSnackBar.info().show());
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
  final result = await AppDataRepository.to.saveAppData(appData).then((value) => value.fold((l) => _exceptionDialog(l), (r) => r));
  return result;
}

Future<AppData?> loadAppData() async {
  var loadResponse = await AppDataRepository.to.loadAppData();
  AppData? appData = loadResponse.fold((l) => _exceptionDialog(l), (r) => r);
  return appData;
}

void printAllData({bool? detailsIncluded}) async {
  var appData = await loadAppData();
  AppStorageService.to.printData(appData: appData, detailsIncluded: detailsIncluded);
}

_exceptionDialog(GeneralException? l) => AppExceptionsDialog.show(exception: l ?? GeneralException.create());

void noInternetConnectionSnackBar() => AppSnackBar.warning(messageInput: Texts.to.network.connection.internetNotAvailable).show();

void showLoadingDialog({bool? isDismissible}) => AppAlertDialogs.to.form(form: AppProgressIndicator.linear(), dismissible: isDismissible);

void appExitDialog() => AppAlertDialogs.to.twoButtons(
  buttonText1: Texts.to.general.ok,
  buttonText2: Texts.to.general.cancel,
  title: Texts.to.general.appExit,
  text: Texts.to.dialogs.general.areYouSure,
  onTapButton1: appExit,
  onTapButton2: popPage,
  dismissible: true,
);

void appReload({AppPageDetail? bootPage}) async {
  showLoadingDialog();
  LoggerService.to.info(message: 'App Reload Triggered');
  Get.reloadAll(force: true);
}

void appReset() {
  LoggerService.to.info(message: 'App Reset Triggered');
  Get.reset();
}

void appRestart() {
  LoggerService.to.info(message: 'App Restart Triggered');
  // kIsWeb ? RestartWeb().restart('webOrigin') : Restart.restartApp();
}

void appExit() {
  LoggerService.to.info(message: 'App Exit Triggered');
  exit(0);
}
