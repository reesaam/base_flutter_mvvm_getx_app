import '../core_info/app_info.dart';

class AppTexts {
  ///App Pages

  ///App Admin Pages

  ///General
  static String get languageNamePersian => 'فارسی';

  ///Settings
  static String get settingBackupFilename => '${AppInfo.appNameInitials}_Backup.json';

  ///Update
  static String get updateAppFilename => '${AppInfo.appNameInitials}_app.apk';

  ///Dio
  static String get dioHeaderContentType => 'Content-Type';
  static String get dioHeaderContentTypeData => 'application/json';
  static String get dioHeaderConnection => 'Connection';
  static String get dioHeaderConnectionData => 'keep-alive';
}
