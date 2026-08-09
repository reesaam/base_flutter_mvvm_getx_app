import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';

@GetPut.controller()
class HomePageController extends CoreController {
  @override
  void pageInit() {
    pageDetail = AppPages.homepage;
  }
}
