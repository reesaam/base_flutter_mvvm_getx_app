import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../../core/extensions/extensions_on_data_models/extension_statistics.dart';

@GetPut.component()
class AppStatistics {
  static AppStatistics get to => Get.find();

  AppStatisticsData data = const AppStatisticsData();

  increaseLaunch() {
    data = data.increaseLaunch();
  }

  increaseLogin() {
    data = data.increaseLogin();
  }

  increaseCrashes() {
    data = data.increaseCrashes();
  }

  increasePageOpens() {
    data = data.increasePageOpens();
  }

  increaseApiCalls() {
    data = data.increaseApiCalls();
  }
}
