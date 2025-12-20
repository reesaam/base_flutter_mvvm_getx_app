import 'package:get/get.dart';

import '../../core/core_functions.dart';
import 'themes.dart';

class AppThemeFunctions {
  static changeDarkMode(bool? darkMode) {
    appLogPrint('DarkMode Changed to $darkMode');
    Get.changeTheme(darkMode == true ? AppThemes.to.darkTheme : AppThemes.to.lightTheme);
  }
}