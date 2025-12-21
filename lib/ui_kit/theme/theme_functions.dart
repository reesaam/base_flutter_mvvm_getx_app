import 'package:get/get.dart';
import '../../core/core_functions.dart';
import '../../core/extensions/theme_extensions/extension_theme.dart';
import 'themes.dart';

class AppThemeFunctions {
  static changeThemeMode(bool? darkMode) {
    appLogPrint('DarkMode Changed to $darkMode');
    Get.changeTheme(darkMode != true ? AppTheme.lightTheme : AppTheme.darkTheme);
  }
}
