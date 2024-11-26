import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';
import 'package:share_plus/share_plus.dart';

import '../../../components/connectivity/connectivity.dart';
import '../../../components/file_functions/file_functions.dart';
import '../../../components/notifications/local_notifications/local_notifications.dart';
import '../../../components/permissions/permissions.dart';
import '../../../components/share/share.dart';
import '../../../components/storage/app_storage_module.dart';
import '../../../core/core_elements/core_controller.dart';
import '../../../shared/shared_models/core_models/app_data/app_data.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../core/extensions/extensions_on_data_models/extension_permission.dart';
import '../../../core/extensions/extensions_on_data_types/extension_date_time.dart';
import '../../../core/extensions/extensions_on_data_types/extension_duration.dart';
import '../../../shared/shared_models/core_models/app_settings_data/app_setting_data.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';
import '../../../core/app_localization.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../ui_kit/theme/themes.dart';

@GetPut.controller()
class AdminTestController extends CoreController {
  Rx<bool> darkMode = false.obs;

  @override
  AppPageDetail get pageDetail => AppPageDetails.adminTestPage;

  ///Internal
  _dialog(String text) async => await AppAlertDialogs.withOk(text: text, onTapOk: popPage);
  String unknownStatus = 'Unknown';

  ///Connections
  changeDarkMode() async {
    darkMode.value = !darkMode.value;
    var settings = loadAppData()?.settings;
    settings = settings?.copyWith(darkMode: darkMode.value) ?? AppSettingData().copyWith(darkMode: darkMode.value);
    saveAppData(appSettingData: settings);
    Get.changeTheme(darkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  ///Connections
  internetConnection() async {
    var result = await AppConnectionChecker().checkInternet();
    await _dialog(result.toString().capitalizeFirst ?? unknownStatus);
  }

  internetStatus() async {
    var result = await AppConnectionChecker().checkInternetStatus();
    await _dialog(result.name.capitalizeFirst ?? unknownStatus);
  }

  checkConnection() async {
    var result = await AppConnectionChecker().checkConnection();
    await _dialog(result.name.capitalizeFirst ?? unknownStatus);
  }

  ///Files
  pickFile() async {
    String message = 'File not Imported';
    var result = await AppFileFunctions().pickFile();
    if (result != null) {
      message = 'Picked FileName:\n${result.path.split('/').last}';
    }
    await _dialog(message);
  }

  saveFile() async {
    String message = 'File nor Saved';
    var resultPick = await AppFileFunctions().pickFile();
    if (resultPick != null) {
      var result = await AppFileFunctions().saveFile(fileName: resultPick.path, data: resultPick.readAsBytesSync());
      message = 'Saved FileName:\n${result?.split('/').last ?? unknownStatus}';
    }
    await _dialog(message);
  }

  ///Permissions
  checkAllPermissions() async {
    var result = await AppPermissions.to.checkAllPermissions();
    String response = Texts.to.empty;
    for (var r in result) {
      response = '$response\n${r.permission}: ${r.status?.getName}';
    }
    await _dialog(response);
  }

  askAllPermissions() async {
    var result = await AppPermissions.to.askAllPermissions();
    String response = Texts.to.empty;
    for (var r in result) {
      var newResponse = '${r.permission}: ${r.status?.getName}';
      response = '$response\n$newResponse';
    }
    await _dialog(response);
  }

  showLocalNotification() async {
    await AppLocalNotifications().simple(
      title: 'Test Notification Title',
      body: 'Test Notification Body',
    );
  }

  showPushNotification() {}

  loadAppDataTest() {
    AppData? appData = loadAppData();
    String response = '';
    response += 'Version: ${appData?.appVersions?.versionsList.isEmpty ?? true ? 'Empty' : appData?.appVersions?.versionsList.last.version}\n';
    response += 'Versions Count: ${appData?.appVersions?.versionsList.length ?? 0}\n';
    response += 'Data Version: ${appData?.dataVersion?.number.toString()}\n';
    response += 'Install DateTime: \n${appData?.statisticsData?.installDateTime.toDateTimeFormat()}\n';
    response += 'Install Duration: \n${appData?.statisticsData?.installDuration.toConditionalFormat()}\n';
    response += 'Launches: ${appData?.statisticsData?.launches.toString()}\n';
    response += 'Page Opens: ${appData?.statisticsData?.pageOpens.toString()}\n';
    response += 'Api Calls: ${appData?.statisticsData?.apiCalls.toString()}\n';
    response += 'Logins: ${appData?.statisticsData?.logins.toString()}\n';
    response += 'Crashes: ${appData?.statisticsData?.crashes.toString()}\n';
    response += 'Language: ${appData?.settings?.language.languageName}\n';
    response += 'Country: ${appData?.settings?.country.countryName}\n';
    response += 'DarkMode: ${appData?.settings?.darkMode}\n';
    _dialog(response);
  }

  importAppDataTest() async => await AppStorage.to.importData();

  exportAppDataTest() async => await AppStorage.to.exportData();

  shareText() async => await AppShare.shareText('Sample Share Text');

  shareUri() async => await AppShare.shareUrl('Sample link');

  shareFile() async {
    File? file = await AppFileFunctions().pickFile();
    if (file == null) {
      await AppAlertDialogs.withOk(text: 'File is not Picked or Loaded', onTapOk: popPage);
    } else {
      await AppShare.shareFile(file: XFile(file.path));
    }
  }

  tempTestFunctionOne() {}

  tempTestFunctionTwo() {}
}
