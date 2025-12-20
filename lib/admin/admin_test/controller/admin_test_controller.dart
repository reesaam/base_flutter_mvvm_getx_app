import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';
import 'package:share_plus/share_plus.dart';

import '../../../components/connectivity/connectivity.dart';
import '../../../components/file_functions/file_functions.dart';
import '../../../components/network/api_methods.dart';
import '../../../components/network/api_methods.dart';
import '../../../components/network/api_methods.dart';
import '../../../components/network/api_methods.dart';
import '../../../components/network/api_methods.dart';
import '../../../components/network/api_methods.dart';
import '../../../components/network/dio_core.dart';
import '../../../components/network/dio_core.dart';
import '../../../components/network/dio_core.dart';
import '../../../components/network/dio_core.dart';
import '../../../components/network/dio_core.dart';
import '../../../components/network/dio_core.dart';
import '../../../components/notifications/local_notifications/local_notifications.dart';
import '../../../components/permissions/permissions.dart';
import '../../../components/share/share.dart';
import '../../../components/storage/app_storage_module.dart';
import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../core/extensions/data_models_extensions/extension_permission.dart';
import '../../../core/extensions/data_types_extensions/extension_date_time.dart';
import '../../../core/extensions/data_types_extensions/extension_duration.dart';
import '../../../localization/localizations.dart';
import '../../../shared/shared_models/core_models/app_data/app_data.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../shared/shared_models/core_models/app_settings_data/app_setting_data.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';
import '../../../ui_kit/theme/theme_functions.dart';

@GetPut.controller()
class AdminTestController extends CoreController {
  Rx<bool> darkMode = false.obs;

  @override
  AppPageDetail get pageDetail => AppPages.adminTestPage;

  ///Internal
  _dialog(String text) async => await AppAlertDialogs.withOk(text: text, onTapOk: popPage);
  String unknownStatus = 'Unknown';

  ///Connections
  changeDarkMode() async {
    darkMode.value = !darkMode.value;
    final loadedAppData = await loadAppData();
    var settings = loadedAppData?.settings;
    settings =
        settings?.copyWith(darkMode: darkMode.value) ?? const AppSettingData().copyWith(darkMode: darkMode.value);
    saveAppData(appSettingData: settings);
    AppThemeFunctions.changeThemeMode(darkMode.value);
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

  ///API
  apiGetData() async {
    const method = APIMethods.get;
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await DioCore.to.callMethod<List>(method: method, url: url);
    final result = response.fold(
      (l) => _dialog('API Call Failed'),
      (r) => _dialog(r.length.toString()),
    );
  }

  apiPostData() async {
    const method = APIMethods.post;
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final Map<String, dynamic> data = {
      "title": "foo",
      "body": "bar",
      "userId": 1,
      "id": 101,
    };
    final response = await DioCore.to.callMethod<Map<String, dynamic>>(method: method, url: url, data: data);
    final result = response.fold(
      (l) => _dialog('API Call Failed'),
      (r) => _dialog(r['title']),
    );
  }

  apiPutData() async {
    const method = APIMethods.put;
    const url = '';
    final response = await DioCore.to.callMethod<String>(method: method, url: url);
    final result = response.fold(
      (l) => _dialog('API Call Failed'),
      (r) => r,
    );
    _dialog(result);
  }

  apiPatchData() async {
    const method = APIMethods.patch;
    const url = '';
    final response = await DioCore.to.callMethod<String>(method: method, url: url);
    final result = response.fold(
      (l) => _dialog('API Call Failed'),
      (r) => r,
    );
    _dialog(result);
  }

  apiDownloadData() async {
    const method = APIMethods.download;
    const url = '';
    final response = await DioCore.to.callMethod<String>(method: method, url: url);
    final result = response.fold(
      (l) => _dialog('API Call Failed'),
      (r) => r,
    );
    _dialog(result);
  }

  apiDeleteData() async {
    const method = APIMethods.delete;
    const url = '';
    final response = await DioCore.to.callMethod<String>(method: method, url: url);
    final result = response.fold(
      (l) => _dialog('API Call Failed'),
      (r) => r,
    );
    _dialog(result);
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
    String response = Texts.to.general.empty;
    for (var r in result) {
      response = '$response\n${r.permission}: ${r.status?.getName}';
    }
    await _dialog(response);
  }

  askAllPermissions() async {
    var result = await AppPermissions.to.askAllPermissions();
    String response = Texts.to.general.empty;
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

  loadAppDataTest() async {
    AppData? appData = await loadAppData();
    String response = '';
    response = 'Load Data Success\n\n';
    response +=
        'Version: ${appData?.appVersions?.versionsList.isEmpty ?? true ? 'Empty' : appData?.appVersions?.versionsList.last.version}\n';
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
    response += 'Country: ${appData?.settings?.country.countryName}\n';
    _dialog(response);
  }

  saveAppDataTest() async {
    bool? result = false;
    String response = '';

    AppData? appData = await loadAppData();
    result = await saveAppData();
    if (result == true) {
      response = 'Save Data Success\n\n';
      response +=
          'Version: ${appData?.appVersions?.versionsList.isEmpty ?? true ? 'Empty' : appData?.appVersions?.versionsList.last.version}\n';
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
    } else {
      response = 'Save Data Error';
    }
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
