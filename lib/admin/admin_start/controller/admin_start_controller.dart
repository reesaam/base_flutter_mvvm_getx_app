import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

@GetPut.controller()
class AdminStartController extends CoreController {
  List<AppPageDetail> pages = createEmptyList<AppPageDetail>();

  @override
  AppPageDetail get pageDetail => AppPages.adminStartPage;

  @override
  void dataInit() {
    pages = AppPages.listAdminPages;
  }
}
