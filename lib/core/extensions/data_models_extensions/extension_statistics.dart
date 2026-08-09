import '../../../barrels/core_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

extension ExtensionAppStatisticsRxClear on Rx<AppStatisticsData> {
  Rx<AppStatisticsData> clearData() => value.clearData().obs;
}

extension ExtensionAppStatisticsClear on AppStatisticsData {
  AppStatisticsData clearData() => const AppStatisticsData();
}

extension ExtensionAppStatisticsCalculations on AppStatisticsData {
  AppStatisticsData calculateInstallDuration() =>
      installDateTime == null ? this : copyWith(installDuration: DateTime.now().difference(installDateTime!));
}
