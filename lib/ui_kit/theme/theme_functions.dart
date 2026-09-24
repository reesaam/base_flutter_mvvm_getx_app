import '../../barrels/annotations_barrel.dart';
import '../../barrels/core_elements_barrel.dart';
import '../../barrels/services_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

@GetPut.component()
class AppThemeFunctions extends CoreComponent {
  static AppThemeFunctions get to => Get.find();

  void changeThemeMode(bool? darkMode) {
    LoggerService.to.log(message: 'Theme Mode Changed to ${darkMode == true ? 'Dark' : 'Light'}');
    Get.changeTheme(darkMode != true ? AppTheme.lightTheme : AppTheme.darkTheme);
    update();
  }
}
