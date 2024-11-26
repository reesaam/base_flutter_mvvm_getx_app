import '../../shared/shared_models/core_models/app_version/app_version.dart';
import '../core_functions.dart';

class AppInfo {
  static String get appName => 'Base Flutter MVVM GetX App';
  static String get appNameInitials => 'BFMGA';
  static String get website => 'resam.site';

  //Versioning
  static AppVersion get currentVersion => const AppVersion(version: '0.0.1');
  static AppVersionsList get versions => loadAppData()?.appVersions ?? AppVersionsList();
  static int get versionsCounter => versions.versionsList.length;

  //Domains
  static String get baseUrl => 'resam.site';
  static String get subDomain => 'basefluttermvvmgetx';

  //FileNames
  static String get fileNameAPK => '${AppInfo.appNameInitials}_android.apk';
  static String get fileNameIPA => '${AppInfo.appNameInitials}_ios.ipa';
  static String get fileNameBackup => '${AppInfo.appNameInitials}_Backup.json';
}
