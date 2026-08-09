import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/shared_models_barrel.dart';
import '../../../barrels/ui_kit_barrel.dart';

@GetPut.controller()
class AdminVerifiersController extends CoreController {
  @override
  AppPageDetail get pageDetail => AppPages.adminVerifiersPage;

  TextEditingController generalController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numericController = TextEditingController();

  Rx<String> general = Texts.to.general.empty.obs;
  Rx<String> password = Texts.to.general.empty.obs;
  Rx<String> phone = Texts.to.general.empty.obs;
  Rx<String> email = Texts.to.general.empty.obs;
  Rx<String> numeric = Texts.to.general.empty.obs;
}
