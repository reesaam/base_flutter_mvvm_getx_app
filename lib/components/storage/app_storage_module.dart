import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../../core/core_info/core_defaults.dart';
import '../../shared/shared_models/core_models/app_data/app_data.dart';
import '../../core/core_resources/core_enums.dart';
import '../../core/core_resources/texts.dart';
import '../../core/extensions/extensions_on_data_types/extension_date_time.dart';
import '../../core/extensions/extensions_on_data_types/extension_duration.dart';
import '../../core/extensions/extensions_on_data_types/extension_string.dart';
import '../failures/local_exception.dart';
import '../file_functions/file_functions.dart';
import 'storage_providers/app_local_storage.dart';
import 'storage_providers/app_shared_preferences.dart';

@GetPut.component()
class AppStorage {
  final _storage = switch (CoreDefaults.defaultStorageProvider) {
    AppStorageProvider.getStorage => AppLocalStorage(),
    AppStorageProvider.sharedPreferences => AppSharedPreferences(),
  };

  static AppStorage get to => Get.find();

  ///Keys
  final _keyAppData = AppStorageKeys.keyAppData;

  Future<Either<LocalException, bool>> clearStorage() async => await _storage.clearStorage(_keyAppData.name);

  ///AppData
  Future<Either<LocalException, bool>> saveAppData({required AppData appData}) async =>
      await _storage.saveData(key: _keyAppData.name, data: appData.toJson());

  Future<Either<LocalException, AppData?>> loadAppData() async {
    final response = await _storage.loadData(_keyAppData.name);
    final result = response.map((r) => r == null ? null : AppData.fromJson(r));
    return result;
  }

  Future<Either<LocalException, bool>> clearAppData() async => await _storage.clearStorage(_keyAppData.name);

  ///Manage Data
  Future<void> exportData() async {
    final appData = await loadAppData();
    appData.fold(
      (l) => null,
      (r) async {
        var appDataJson = (appData as AppData).toJson();
        Uint8List data = appDataJson.toString().toUInt8List();
        String? savedPath = await AppFileFunctions.to.saveFile(fileName: AppTexts.settingBackupFilename, data: data);
        appLogPrint('File Path: $savedPath');
        appLogPrint('Backup File Exported');
      },
    );
  }

  Future<void> importData() async {
    var appDataFile = await AppFileFunctions.to.pickFile();

    if (appDataFile != null) {
      clearAppData();
      String stringCharCodes = String.fromCharCodes(appDataFile.readAsBytesSync());
      AppData appData = AppData.fromJson(json.decode(stringCharCodes));

      ///Filling Data Fields
      if (appData.dataVersion == AppDataVersions.values.last) {
        saveAppData(appData: appData);
        appLogPrint('Data Imported');
      } else {
        appLogPrint('Data Version is not Compatible, Converter is not Implemented\nData Import Failed');
      }
    } else {
      appDebugPrint('Imported File was NUll');
    }
  }

  void printData({AppData? appData, bool? detailsIncluded}) {
    String unknown = Texts.to.notAvailableInitials;

    if (appData != null) {
      appLogPrint('==> App Data:');
      appLogPrint('App Version: ${appData.appVersions?.versionsList.lastOrNull?.version ?? unknown}');
      detailsIncluded == true ? appLogPrint('App Version Type: ${appData.appVersions?.versionsList.lastOrNull?.versionType ?? unknown}') : null;
      appLogPrint('App Data Type: ${appData.dataVersion?.number ?? unknown}');
      if (detailsIncluded == true) {
        appLogPrint('==> Details:');
        appLogPrint('Settings / Dark Mode: ${appData.settings?.darkMode}');
        appLogPrint('Settings / Language: ${appData.settings?.language?.languageName}');
      }
    }

    if (appData?.statisticsData != null) {
      appLogPrint('==> Statistics:');
      appLogPrint('Statistics / Launches: ${appData?.statisticsData?.launches}');
      appLogPrint('Statistics / Logins: ${appData?.statisticsData?.logins}');
      appLogPrint('Statistics / Crashes: ${appData?.statisticsData?.crashes}');
      appLogPrint('Statistics / Page Opens: ${appData?.statisticsData?.pageOpens}');
      appLogPrint('Statistics / API Calls: ${appData?.statisticsData?.apiCalls}');
      appLogPrint('Statistics / Install DateTime: ${appData?.statisticsData?.installDateTime.toDateTimeFormat}');
      appLogPrint('Statistics / Install Duration: ${appData?.statisticsData?.installDuration.toConditionalFormat}');
    }
  }
}
