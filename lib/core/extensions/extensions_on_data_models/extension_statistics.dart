import 'package:get/get.dart';

import '../../../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../../core_functions.dart';

extension ExtensionAppStatisticsRxClear on Rx<AppStatisticsData> {
  Rx<AppStatisticsData> clearData() => value.clearData().obs;
}

extension ExtensionAppStatisticsClear on AppStatisticsData {
  AppStatisticsData clearData() => const AppStatisticsData();
}

extension ExtensionAppStatisticsIncreases on AppStatisticsData {
  //Data
  AppStatisticsData increaseLaunch() {
    final result = copyWith(launches: launches == null ? 0 : launches! + 1);
    _saveDataOnStorage(result);
    return result;
  }

  AppStatisticsData increaseLogin() {
    final result = copyWith(logins: logins == null ? 0 : logins! + 1);
    _saveDataOnStorage(result);
    return result;
  }

  AppStatisticsData increaseCrashes() {
    final result = copyWith(crashes: crashes == null ? 0 : crashes! + 1);
    _saveDataOnStorage(result);
    return result;
  }

  AppStatisticsData increasePageOpens() {
    final result = copyWith(pageOpens: pageOpens == null ? 0 : pageOpens! + 1);
    _saveDataOnStorage(result);
    return result;
  }

  AppStatisticsData increaseApiCalls() {
    final result = copyWith(apiCalls: apiCalls == null ? 0 : apiCalls! + 1);
    _saveDataOnStorage(result);
    return result;
  }
}

extension ExtensionAppStatisticsCalculations on AppStatisticsData {
  AppStatisticsData calculateInstallDuration() =>
      installDateTime == null ? this : copyWith(installDuration: DateTime.now().difference(installDateTime!));
}

_saveDataOnStorage(AppStatisticsData data) => saveAppData(appStatisticsData: data);