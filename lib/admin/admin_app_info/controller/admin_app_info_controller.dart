import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

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
