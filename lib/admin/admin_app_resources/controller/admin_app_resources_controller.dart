import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';

@GetPut.controller()
class AdminAppResourcesController extends CoreController {

  @override
  AppPageDetail get pageDetail => AppPages.adminAppResourcesPage;
}
