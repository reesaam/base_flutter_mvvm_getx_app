import '../../shared/shared_models/core_models/app_version/app_version.dart';

class AppInfo {
  static const String appName = 'Base Flutter MVVM GetX App';
  static const String appNameInitials = 'BFMGA';
  static const String website = 'resam.site';

  //Versioning
  static const AppVersion currentVersion = AppVersion(version: '0.0.1');

  //Domains
  static const String baseUrl = 'resam.site';
  static const String subDomain = 'basefluttermvvmgetx';

  //FileNames
  static const String fileNameAPK = '${AppInfo.appNameInitials}_android.apk';
  static const String fileNameIPA = '${AppInfo.appNameInitials}_ios.ipa';
  static const String fileNameBackup = '${AppInfo.appNameInitials}_Backup.json';
}
