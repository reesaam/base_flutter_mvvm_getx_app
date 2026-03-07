import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';

import '../../../core/core_elements/core_controller.dart';

@GetPut.controller()
class HomePageController extends CoreController {

  @override
  void pageInit() {
    pageDetail = AppPages.homepage;
  }
}
