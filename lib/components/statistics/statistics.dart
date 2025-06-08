import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../core/core_functions.dart';
import '../../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';

@GetPut.component()
class AppStatistics {
  static AppStatistics get to => Get.find();

  AppStatisticsData data = const AppStatisticsData();

  void increaseLaunch() => _addStatistics(launches: true);
  void increaseLogin() => _addStatistics(logins: true);
  void increaseCrashes() => _addStatistics(crashes: true);
  void increasePageOpens() => _addStatistics(pageOpens: true);
  void increaseApiCalls() => _addStatistics(apiCalls: true);

  void _addStatistics({
    bool? launches,
    bool? logins,
    bool? crashes,
    bool? pageOpens,
    bool? apiCalls,
  }) {
    final appData = loadAppData();
    if (appData != null && appData.statisticsData != null) {
      data = appData.statisticsData ?? const AppStatisticsData();
      if (launches == true) data = data.copyWith(launches: data.launches == null ? 1 : data.launches! + 1);
      if (logins == true) data = data.copyWith(logins: data.logins == null ? 1 : data.logins! + 1);
      if (crashes == true) data = data.copyWith(crashes: data.crashes == null ? 1 : data.crashes! + 1);
      if (pageOpens == true) data = data.copyWith(pageOpens: data.pageOpens == null ? 1 : data.pageOpens! + 1);
      if (apiCalls == true) data = data.copyWith(apiCalls: data.apiCalls == null ? 1 : data.apiCalls! + 1);
      _saveDataOnStorage(data);
    }
  }

  void _saveDataOnStorage(AppStatisticsData data) => saveAppData(appStatisticsData: data);
}
