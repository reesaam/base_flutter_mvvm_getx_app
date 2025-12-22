import '../../core/core_elements/core_controller.dart';
import '../theme/themes.dart';
import '../../core/core_functions.dart';

@GetPut.component()
class AppThemeFunctions extends CoreController {
  static AppThemeFunctions get to => Get.find();

  changeThemeMode(bool? darkMode) {
    appLogPrint('Theme Mode Changed to ${darkMode == true ? 'Dark' : 'Light'}');
    Get.changeTheme(darkMode != true ? AppTheme.lightTheme : AppTheme.darkTheme);
    update();
  }
}
