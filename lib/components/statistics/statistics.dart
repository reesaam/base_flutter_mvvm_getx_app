import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/shared_models_barrel.dart';

@GetPut.component()
class AppStatistics extends CoreComponent {
  static AppStatistics get to => Get.find();

  void increaseLaunch() => _addStatistics(launches: true);
  void increaseLogin() => _addStatistics(logins: true);
  void increaseCrashes() => _addStatistics(crashes: true);
  void increasePageOpens() => _addStatistics(pageOpens: true);
  void increaseApiCalls() => _addStatistics(apiCalls: true);

  void _addStatistics({bool? launches, bool? logins, bool? crashes, bool? pageOpens, bool? apiCalls}) async {
    final appData = await loadAppData();
    if (appData != null && appData.statisticsData != null) {
      AppStatisticsData data = appData.statisticsData ?? const AppStatisticsData();
      AppStatisticsData statisticsData = AppStatisticsData(
        launches: launches == true ? (data.launches ?? 0) + 1 : data.launches,
        logins: logins == true ? (data.logins ?? 0) + 1 : data.logins,
        crashes: crashes == true ? (data.crashes ?? 0) + 1 : data.crashes,
        pageOpens: pageOpens == true ? (data.pageOpens ?? 0) + 1 : data.pageOpens,
        apiCalls: apiCalls == true ? (data.apiCalls ?? 0) + 1 : data.apiCalls,
      );
      saveAppData(appStatisticsData: statisticsData);
    }
  }
}
