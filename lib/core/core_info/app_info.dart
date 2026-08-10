import '../../barrels/core_resources_barrel.dart';
import '../../barrels/shared_models_barrel.dart';

class AppInfo {
  static const String appName = 'Base Flutter MVVM GetX App';
  static const String appNameInitials = 'BFMGA';
  static const String website = 'resam.site';

  // Version
  static const AppVersion currentVersion = AppVersion(version: '0.2.0');

  // Environment — change this to switch the whole app (dev / stage / production)
  static const Environment environment = Environment.development;

  // FileNames
  static const String fileNameAPK = '${AppInfo.appNameInitials}_android.apk';
  static const String fileNameIPA = '${AppInfo.appNameInitials}_ios.ipa';
  static const String fileNameBackup = '${AppInfo.appNameInitials}_Backup.json';
}
