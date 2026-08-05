import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

@GetPut.controller()
class AdminDataFormatCheckController extends CoreController {

  @override
  AppPageDetail get pageDetail => AppPages.adminDataFormatCheckPage;

  functionCalledDialog() => AppAlertDialogs.withOk(text: 'Function Called', onTapOk: popPage);
}
