import '../../../core/core_barrel.dart';

import '../../../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';

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