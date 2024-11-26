import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_functions.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../core/extensions/extensions_on_data_models/extension_statistics.dart';

@GetPut.controller()
class AdminAppInfoController extends CoreController {
  Rx<AppStatisticsData> statisticsData = const AppStatisticsData().obs;

  @override
  AppPageDetail get pageDetail => AppPageDetails.adminAppInfoPage;

  @override
  void dataInit() {
    statisticsData.value = loadAppData()?.statisticsData ?? const AppStatisticsData();
  }
}
