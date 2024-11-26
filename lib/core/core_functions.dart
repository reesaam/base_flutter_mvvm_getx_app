import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../components/connectivity/connectivity.dart';
import '../components/storage/app_storage_module.dart';
import '../localization/localizations.dart';
import '../shared/shared_models/core_models/app_data/app_data.dart';
import '../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../shared/shared_models/core_models/app_settings_data/app_setting_data.dart';
import '../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../shared/shared_models/core_models/app_version/app_version.dart';
import '../ui_kit/dialogs/app_alert_dialogs.dart';
import '../ui_kit/dialogs/app_alert_widget_dialogs.dart';
import '../ui_kit/dialogs/specific_dialogs/exceptions_dialog.dart';
import '../ui_kit/main_widgets/progress_indicator.dart';
import '../ui_kit/main_widgets/snackbar.dart';
import 'app_routing/app_routing.dart';
import 'core_resources/core_enums.dart';
import 'core_resources/core_flags.dart';
import '../features/versions/data/versions_local_data_source.dart';
import '../features/versions/data/versions_remote_data_source.dart';

void appDebugPrint(message) => CoreFlags.isRelease ? null : debugPrint('[Debug] $message');
void appLogPrint(message) => debugPrint('[LOG] $message');

void popPage() {
  Get.back();
}

nullFunction() => null;

bool? clearAppData() {
  bool result = false;
  AppStorage.to.clearStorage().then((value) => value.fold((l) => AppExceptionsDialog.local(exception: l), (r) => result = r));
  return result;
}

bool? saveAppData({
  AppVersionsList? appVersionData,
  AppDataVersions? appDataVersionData,
  AppSettingData? appSettingData,
  AppStatisticsData? appStatisticsData,
}) {
  bool result = false;
  AppData? loadedData = loadAppData();
  AppData appData = AppData(
    appVersions: appVersionData ?? loadedData?.appVersions,
    dataVersion: appDataVersionData ?? loadedData?.dataVersion,
    settings: appSettingData ?? loadedData?.settings,
    statisticsData: appStatisticsData ?? loadedData?.statisticsData,
  );
  AppStorage.to.saveAppData(appData: appData).then((value) => value.fold((l) => AppExceptionsDialog.local(exception: l), (r) => result = r));
  return result;
}

AppData? loadAppData() {
  AppData? appData;
  AppStorage.to.loadAppData().then((value) => value.fold((l) => AppExceptionsDialog.local(exception: l), (r) => appData = r));
  return appData;
}

void printAllData({bool? detailsIncluded}) async {
  AppData? appData = loadAppData();
  AppStorage.to.printData(appData: appData, detailsIncluded: detailsIncluded);
}

Future<AppVersionsList?> getVersions() async {
  bool internetAvailability =  await AppConnectionChecker.to.checkInternet();
  AppVersionsList? versionsList;
  if (internetAvailability) {
    var response = await VersionsRemoteDataSource().getVersions();
    versionsList = response.fold((l) => null, (r) => r);
  }
  if (versionsList == null) {
    var response = await VersionsLocalDataSource().getVersions();
    versionsList = response.fold((l) => null, (r) => r);
  }
  return versionsList;
}

Future<AppVersion?> checkAvailableVersion() async {
  AppVersionsList? response = await getVersions();
  return response?.versionsList.isEmpty ?? false ? null : response?.versionsList.last;
}

Future<void> checkForceUpdate() async {
  AppVersion? version = await checkAvailableVersion();
  if (version != null) {
    if (version.isForceUpdate == true) {
      goToUpdatePage(popAll: true);
    }
  }
}

noInternetConnectionSnackBar() => AppSnackBar.show(message: Texts.to.connection.connectionInternetNotAvailableText);

showLoadingDialog({bool? isDismissible}) => AppAlertWidgetDialogs().withoutButton(widget: AppProgressIndicator.linear(), dismissible: isDismissible);

appExitDialog() => AppAlertDialogs.withOkCancel(title: Texts.to.general.appExit, text: Texts.to.dialogs.areYouSure, onTapOk: appExit, dismissible: true);

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
