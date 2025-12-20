import 'package:get/get.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../shared/shared_models/core_models/app_statistics_data/app_statistics_data.dart';

class AppDocsController extends CoreController {
  @override
  AppPageDetail get pageDetail => AppPages.appDocs;

  Rx<AppStatisticsData> statisticsData = const AppStatisticsData().obs;

  @override
  void dataInit() async {
    final loadedAppData = await loadAppData();
    statisticsData.value = loadedAppData?.statisticsData ?? statisticsData.value;
  }

  generateDocs() {}
}
