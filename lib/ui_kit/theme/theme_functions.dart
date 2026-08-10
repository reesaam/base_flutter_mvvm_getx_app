import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

@GetPut.component()
class AppThemeFunctions extends CoreController {
  static AppThemeFunctions get to => Get.find();

  changeThemeMode(bool? darkMode) {
    appLogPrint('Theme Mode Changed to ${darkMode == true ? 'Dark' : 'Light'}');
    Get.changeTheme(darkMode != true ? AppTheme.lightTheme : AppTheme.darkTheme);
    update();
  }
}
