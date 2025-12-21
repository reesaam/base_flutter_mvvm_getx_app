import 'package:get/get.dart';
import 'package:getx_binding_annotation/get_put_annotation.dart';
import '../../core/core_elements/core_controller.dart';
import '../../core/core_functions.dart';
import '../../core/extensions/theme_extensions/extension_theme.dart';
import 'themes.dart';

@GetPut.component()
class AppThemeFunctions extends CoreController {
  static AppThemeFunctions get to => Get.find();

  changeThemeMode(bool? darkMode) {
    appLogPrint('Theme Mode Changed to ${darkMode == true ? 'Dark' : 'Light'}');
    Get.changeTheme(darkMode != true ? AppTheme.lightTheme : AppTheme.darkTheme);
    update();
  }
}
