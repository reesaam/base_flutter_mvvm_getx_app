import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';

@GetPut.controller()
class AdminAppInfoController extends CoreController {
  Rx<AppStatisticsData> statisticsData = const AppStatisticsData().obs;

  @override
  AppPageDetail get pageDetail => AppPages.adminAppInfoPage;

  @override
  void dataInit() async {
    final loadedAppData = await loadAppData();
    statisticsData.value = loadedAppData?.statisticsData ?? statisticsData.value;
  }
}
