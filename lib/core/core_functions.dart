import 'dart:io';

import '../barrels/components_barrel.dart';
import '../barrels/core_barrel.dart';
import '../barrels/core_resources_barrel.dart';
import '../barrels/localization_barrel.dart';
import '../barrels/shared_models_barrel.dart';
import '../barrels/ui_kit_barrel.dart';
import 'core_resources/core_enums.dart';

void appDebugPrint(message) => CoreFlags.isRelease ? null : debugPrint('[Debug] $message');
void appLogPrint(message) => debugPrint('[LOG] $message');

void popPage() {
  Get.back();
}

nullFunction() => null;

void clearAppData() async {
  final response = await AppStorage.to.clearStorage();
  response.fold(
    (l) => AppExceptionsDialog.show(exception: l),
    (r) => AppSnackBar.show(),
  );
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
  final result = await AppStorage.to
      .saveAppData(appData: appData)
      .then((value) => value.fold((l) => AppExceptionsDialog.show(exception: l), (r) => r));
  return result;
}

Future<AppData?> loadAppData() async {
  AppData? appData = await AppStorage.to
      .loadAppData()
      .then((value) => value.fold((l) => AppExceptionsDialog.show(exception: l), (r) => r));
  return appData;
}

void printAllData({bool? detailsIncluded}) async {
  AppData? appData = await loadAppData();
  AppStorage.to.printData(appData: appData, detailsIncluded: detailsIncluded);
}

noInternetConnectionSnackBar() => AppSnackBar.show(message: Texts.to.network.connection.internetNotAvailable);

showLoadingDialog({bool? isDismissible}) =>
    AppAlertWidgetDialogs().withoutButton(widget: AppProgressIndicator.linear(), dismissible: isDismissible);

appExitDialog() => AppAlertDialogs.withOkCancel(
    title: Texts.to.general.appExit, text: Texts.to.dialogs.general.areYouSure, onTapOk: appExit, dismissible: true);

appReload({AppPageDetail? bootPage}) async {
  showLoadingDialog();
  appLogPrint('App Reload Triggered');
  Get.reloadAll(force: true);
}

appReset() {
  appLogPrint('App Reset Triggered');
  Get.reset();
}

appRestart() {
  appLogPrint('App Restart Triggered');
  // kIsWeb ? RestartWeb().restart('webOrigin') : Restart.restartApp();
}

appExit() {
  appLogPrint('App Exit Triggered');
  exit(0);
}
