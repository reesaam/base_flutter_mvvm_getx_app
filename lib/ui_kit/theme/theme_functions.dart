import 'package:get/get.dart';

import '../../components/storage/app_storage_module.dart';
import '../../core/core_functions.dart';
import 'themes.dart';

class AppThemeFunctions {
  static changeDarkMode(bool? darkMode) {
    appLogPrint('DarkMode Changed to $darkMode');
    Get.changeTheme(darkMode == true ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  static bool getMode() {
    bool? isDark = false;
    AppStorage.to.loadAppData().then((value) => value.fold((l) => null, (r) => isDark = r?.settings?.darkMode));
    return isDark == true;
  }
}