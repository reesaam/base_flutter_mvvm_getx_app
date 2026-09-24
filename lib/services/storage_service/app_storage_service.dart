import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../barrels/annotations_barrel.dart';
import '../../barrels/components_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/services_barrel.dart';
import '../../barrels/shared_models_barrel.dart';

import 'app_storage_service_abstraction.dart';
import 'storage_providers/local_storage.dart';
import 'storage_providers/shared_preferences.dart';

@GetPut.service()
class AppStorageService extends CoreService {
  AppStorageService({AppStoragesAbstraction? storage}) : _storage = storage ?? _createStorage();

  static AppStorageService get to => Get.find();
  final AppStoragesAbstraction _storage;

  static AppStoragesAbstraction _createStorage() => switch (CoreDefaults.defaultStorageProvider) {
    AppStorageProvider.getStorage => AppLocalStorage(),
    AppStorageProvider.sharedPreferences => AppSharedPreferences(),
  };

  ///Keys
  final _keyAppData = AppStorageKeys.appData;

  Future<BaseLocalResponse<bool>> clearStorage() async {
    return await _storage.clear(_keyAppData.name);
  }

  ///AppData
  Future<BaseLocalResponse<bool>> saveAppData({required AppData appData}) async =>
      await _storage.saveData(key: _keyAppData.name, data: appData.toJson());

  Future<BaseLocalResponse<AppData?>> loadAppData() async {
    final response = await _storage.loadData(_keyAppData.name);
    final result = response.map((r) => r == null ? null : AppData.fromJson(r));
    return result;
  }

  Future<BaseLocalResponse<bool>> clearAppData() async => await _storage.clear(_keyAppData.name);

  ///Manage Data
  Future<void> exportData() async {
    final appData = await loadAppData();
    appData.fold((l) => null, (r) async {
      var appDataJson = (appData as AppData).toJson();
      Uint8List data = appDataJson.toString().toUInt8List();
      String? savedPath = await AppFileFunctions.to.saveFile(fileName: AppTexts.settingBackupFilename, data: data);
      LoggerService.to.log(message: 'File Path: $savedPath');
      LoggerService.to.log(message: 'Backup File Exported');
    });
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
        LoggerService.to.log(message: 'Data Imported');
      } else {
        LoggerService.to.log(message: 'Data Version is not Compatible, Converter is not Implemented\nData Import Failed');
      }
    } else {
      LoggerService.to.devLog(message: 'Imported File was NUll');
    }
  }

  void printData({AppData? appData, bool? detailsIncluded}) {
    String unknown = Texts.to.general.notAvailableInitials;

    if (appData != null) {
      LoggerService.to.log(message: '==> App Data:');
      LoggerService.to.log(message: 'App Version: ${appData.appVersions?.versionsList.lastOrNull?.version ?? unknown}');
      detailsIncluded == true ? LoggerService.to.log(message: 'App Version Type: ${appData.appVersions?.versionsList.lastOrNull?.versionType ?? unknown}') : null;
      LoggerService.to.log(message: 'App Data Type: ${appData.dataVersion?.number ?? unknown}');
      if (detailsIncluded == true) {
        LoggerService.to.log(message: '==> Details:');
        LoggerService.to.log(message: 'Settings / Dark Mode: ${appData.settings?.darkMode}');
        LoggerService.to.log(message: 'Settings / Language: ${appData.settings?.language.languageName}');
      }
    }

    if (appData?.statisticsData != null) {
      LoggerService.to.log(message: '==> Statistics:');
      LoggerService.to.log(message: 'Statistics / Launches: ${appData?.statisticsData?.launches}');
      LoggerService.to.log(message: 'Statistics / Logins: ${appData?.statisticsData?.logins}');
      LoggerService.to.log(message: 'Statistics / Crashes: ${appData?.statisticsData?.crashes}');
      LoggerService.to.log(message: 'Statistics / Page Opens: ${appData?.statisticsData?.pageOpens}');
      LoggerService.to.log(message: 'Statistics / API Calls: ${appData?.statisticsData?.apiCalls}');
      LoggerService.to.log(message: 'Statistics / Install DateTime: ${appData?.statisticsData?.installDateTime.toDateTimeFormat}');
      LoggerService.to.log(message: 'Statistics / Install Duration: ${appData?.statisticsData?.installDuration.toConditionalFormat}');
    }
  }
}
