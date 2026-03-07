import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

@GetPut.controller()
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
