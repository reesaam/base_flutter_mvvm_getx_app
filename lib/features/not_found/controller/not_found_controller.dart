import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

@GetPut.controller()
class NotFoundController extends CoreController {
  late Icon icon;

  @override
  void pageInit() {
    pageDetail = AppPages.notFound;
    icon = AppIcons.notFound.widget;
  }
}
