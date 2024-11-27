// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'translation.i69n.dart';

String get _languageCode => 'fa';
String get _localeName => 'fa';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Translation_fa extends Translation {
  const Translation_fa();
  LanguageTranslation_fa get language => LanguageTranslation_fa(this);
  AppTranslation_fa get app => AppTranslation_fa(this);
  PagesNameTranslation_fa get pagesName => PagesNameTranslation_fa(this);
  AdminPagesNameTranslation_fa get adminPagesName =>
      AdminPagesNameTranslation_fa(this);
  GeneralTranslation_fa get general => GeneralTranslation_fa(this);
  DialogsTranslation_fa get dialogs => DialogsTranslation_fa(this);
  ConnectionTranslation_fa get connection => ConnectionTranslation_fa(this);
  SettingsTranslation_fa get settings => SettingsTranslation_fa(this);
  UpdateTranslation_fa get update => UpdateTranslation_fa(this);
  AboutTranslation_fa get about => AboutTranslation_fa(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'language':
        return language;
      case 'app':
        return app;
      case 'pagesName':
        return pagesName;
      case 'adminPagesName':
        return adminPagesName;
      case 'general':
        return general;
      case 'dialogs':
        return dialogs;
      case 'connection':
        return connection;
      case 'settings':
        return settings;
      case 'update':
        return update;
      case 'about':
        return about;
      default:
        return super[key];
    }
  }
}

class LanguageTranslation_fa extends LanguageTranslation {
  final Translation_fa _parent;
  const LanguageTranslation_fa(this._parent) : super(_parent);
  String get languageName => "Persian";
  String get languageCode => "fa";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'languageName':
        return languageName;
      case 'languageCode':
        return languageCode;
      default:
        return super[key];
    }
  }
}

class AppTranslation_fa extends AppTranslation {
  final Translation_fa _parent;
  const AppTranslation_fa(this._parent) : super(_parent);
  String get appName => "Base Flutter MVVM GetX App";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'appName':
        return appName;
      default:
        return super[key];
    }
  }
}

class PagesNameTranslation_fa extends PagesNameTranslation {
  final Translation_fa _parent;
  const PagesNameTranslation_fa(this._parent) : super(_parent);
  String get splashScreenPageName => "صفحه اسپلش";
  String get homePageName => "خانه";
  String get settingsPageName => "تنظیمات";
  String get updatePageName => "بروزرسانی";
  String get aboutPageName => "درباره";
  String get notFoundPageName => "صفحه پیدا نشد";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'splashScreenPageName':
        return splashScreenPageName;
      case 'homePageName':
        return homePageName;
      case 'settingsPageName':
        return settingsPageName;
      case 'updatePageName':
        return updatePageName;
      case 'aboutPageName':
        return aboutPageName;
      case 'notFoundPageName':
        return notFoundPageName;
      default:
        return super[key];
    }
  }
}

class AdminPagesNameTranslation_fa extends AdminPagesNameTranslation {
  final Translation_fa _parent;
  const AdminPagesNameTranslation_fa(this._parent) : super(_parent);
  String get adminStartPagePageName => "Admin Start Page";
  String get adminTestPageName => "Test Page";
  String get adminAppInfoPageName => "App Info Page";
  String get adminAppResourcesPageName => "App Resources Page";
  String get adminWidgetCheckPageName => "Widget Check Page";
  String get adminDataFormatCheckPageName => "Data Format Check Page";
  String get adminVerifiersPageName => "Verifiers Page";
  String get adminAppCountriesPageName => "App Countries Page";
  String get appDocsPageName => "App Docs Page";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'adminStartPagePageName':
        return adminStartPagePageName;
      case 'adminTestPageName':
        return adminTestPageName;
      case 'adminAppInfoPageName':
        return adminAppInfoPageName;
      case 'adminAppResourcesPageName':
        return adminAppResourcesPageName;
      case 'adminWidgetCheckPageName':
        return adminWidgetCheckPageName;
      case 'adminDataFormatCheckPageName':
        return adminDataFormatCheckPageName;
      case 'adminVerifiersPageName':
        return adminVerifiersPageName;
      case 'adminAppCountriesPageName':
        return adminAppCountriesPageName;
      case 'appDocsPageName':
        return appDocsPageName;
      default:
        return super[key];
    }
  }
}

class GeneralTranslation_fa extends GeneralTranslation {
  final Translation_fa _parent;
  const GeneralTranslation_fa(this._parent) : super(_parent);
  String get empty => "null";
  String get dash => "-";
  String get version => "نسخه";
  String get ok => "تایید";
  String get cancel => "لغو";
  String get yes => "باه";
  String get no => "خیر";
  String get notAvailable => "وجود ندارد";
  String get notAvailableInitials => "وجود ندارد";
  String get total => "مجموع";
  String get from => "از";
  String get to => "تا";
  String get warning => "توجه";
  String get alert => "اخطار";
  String get information => "اطلاعات";
  String get info => "اطلاعات";
  String get incorrect => "اشتباه";
  String get totalBalance => "بالانس کل";
  String get appExit => "خروج از برنامه";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'empty':
        return empty;
      case 'dash':
        return dash;
      case 'version':
        return version;
      case 'ok':
        return ok;
      case 'cancel':
        return cancel;
      case 'yes':
        return yes;
      case 'no':
        return no;
      case 'notAvailable':
        return notAvailable;
      case 'notAvailableInitials':
        return notAvailableInitials;
      case 'total':
        return total;
      case 'from':
        return from;
      case 'to':
        return to;
      case 'warning':
        return warning;
      case 'alert':
        return alert;
      case 'information':
        return information;
      case 'info':
        return info;
      case 'incorrect':
        return incorrect;
      case 'totalBalance':
        return totalBalance;
      case 'appExit':
        return appExit;
      default:
        return super[key];
    }
  }
}

class DialogsTranslation_fa extends DialogsTranslation {
  final Translation_fa _parent;
  const DialogsTranslation_fa(this._parent) : super(_parent);
  String get areYouSure => "آیا مطمئن هستید؟";
  String get areYouSureDataWillLost =>
      "${areYouSure}\n اطلاعات شما از بین خواهد رفت.";
  String get areYouSureDataMayLost =>
      "${areYouSure}\n اطلاعات شما ممکن است از بین برود.";
  String get areYouSureDataExport =>
      "${areYouSure}\n اطلاعات شما استخراج خواهد شد.";
  String get areYouSureDataImport =>
      "${areYouSure}\n اطلاعات شما وارد خواهد شد.";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'areYouSure':
        return areYouSure;
      case 'areYouSureDataWillLost':
        return areYouSureDataWillLost;
      case 'areYouSureDataMayLost':
        return areYouSureDataMayLost;
      case 'areYouSureDataExport':
        return areYouSureDataExport;
      case 'areYouSureDataImport':
        return areYouSureDataImport;
      default:
        return super[key];
    }
  }
}

class ConnectionTranslation_fa extends ConnectionTranslation {
  final Translation_fa _parent;
  const ConnectionTranslation_fa(this._parent) : super(_parent);
  String get connectionInternetNotAvailableTitle => "اتصال اینترنت";
  String get connectionInternetNotAvailableText =>
      "اینترنت موجود نیست، لطفا اتصال خود را بررسی کنید";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'connectionInternetNotAvailableTitle':
        return connectionInternetNotAvailableTitle;
      case 'connectionInternetNotAvailableText':
        return connectionInternetNotAvailableText;
      default:
        return super[key];
    }
  }
}

class SettingsTranslation_fa extends SettingsTranslation {
  final Translation_fa _parent;
  const SettingsTranslation_fa(this._parent) : super(_parent);
  String get settingsLanguageModalSelectLanguage => "انتخاب زبان";
  String get settingsAppbarMenuResetSettings => "بازنشانی تمامی تنظیمات";
  String get settingsSectionTitleGeneral => "عمومی";
  String get settingsSectionTitleGeneralLanguage => "زبان";
  String get settingsSectionTitleGeneralCalendar => "نوع تقویم";
  String get settingsSectionGeneralItemDarkMode => "حالت تاریک";
  String get settingsSectionTitleUpdate => "بروزرسانی";
  String get settingsSectionTitleUpdateCurrentVersion => "نسخه فعلی";
  String get settingsSectionTitleUpdateAvailableVersion => "نسخه در دسترس";
  String get settingsSectionTitleBackup => "پشتیبان گیری";
  String get settingsSectionBackupBackup => "پشتیبان گیری اطلاعات";
  String get settingsSectionBackupRestore => "بازیابی اطلاعات";
  String get settingsSectionTitleStorage => "حافظه";
  String get settingsSectionStorageItemEraseAllData => "پاک کردن تمامی اطلاعات";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'settingsLanguageModalSelectLanguage':
        return settingsLanguageModalSelectLanguage;
      case 'settingsAppbarMenuResetSettings':
        return settingsAppbarMenuResetSettings;
      case 'settingsSectionTitleGeneral':
        return settingsSectionTitleGeneral;
      case 'settingsSectionTitleGeneralLanguage':
        return settingsSectionTitleGeneralLanguage;
      case 'settingsSectionTitleGeneralCalendar':
        return settingsSectionTitleGeneralCalendar;
      case 'settingsSectionGeneralItemDarkMode':
        return settingsSectionGeneralItemDarkMode;
      case 'settingsSectionTitleUpdate':
        return settingsSectionTitleUpdate;
      case 'settingsSectionTitleUpdateCurrentVersion':
        return settingsSectionTitleUpdateCurrentVersion;
      case 'settingsSectionTitleUpdateAvailableVersion':
        return settingsSectionTitleUpdateAvailableVersion;
      case 'settingsSectionTitleBackup':
        return settingsSectionTitleBackup;
      case 'settingsSectionBackupBackup':
        return settingsSectionBackupBackup;
      case 'settingsSectionBackupRestore':
        return settingsSectionBackupRestore;
      case 'settingsSectionTitleStorage':
        return settingsSectionTitleStorage;
      case 'settingsSectionStorageItemEraseAllData':
        return settingsSectionStorageItemEraseAllData;
      default:
        return super[key];
    }
  }
}

class UpdateTranslation_fa extends UpdateTranslation {
  final Translation_fa _parent;
  const UpdateTranslation_fa(this._parent) : super(_parent);
  String get updateCurrentVersion => "نسخه فعلی";
  String get updateAvailableVersion => "نسخه جدید در دسترس";
  String get updateCheckUpdate => "بررسی بروزرسانی";
  String get updateDownloadUpdate => "دانلود بروزرسانی";
  String get updateNewVersion => "نسخه جدید پیدا شد";
  String get updateApprove => "آیا تمایل دارید نسخه جدید را دانلود کنید؟";
  String get updateCheckingUpdate => "بررسی برای نسخه در دسترس ...";
  String get updateUpdateFound => "نسخه جدید در دسترس است!";
  String get updateNoUpdateFound => "نسخه جدیدی در دسترس نیست";
  String get updateDownloading => "در حال دانلود ...";
  String get updateDownloaded => "بروزرسانی دانلود شد";
  String get updateInstallationTitle => "در حال نصب بروزرسانی";
  String get updateInstallationContent =>
      "آیا تمایل به بروزرسانی دارید؟\n\n توجه! برنامه بسته خواهد شد";
  String get updateDirectoryNotFoundTitle => "خطای دایرکتوری!";
  String get updateDirectoryNotFoundContent =>
      "هیچ دایرکتوری برای ذخیره اطلاعات موجود نیست";
  String get updateFileNotFoundTitle => "خطای فایل!";
  String get updateFileNotFoundContent => "فایل پیدا نشد";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'updateCurrentVersion':
        return updateCurrentVersion;
      case 'updateAvailableVersion':
        return updateAvailableVersion;
      case 'updateCheckUpdate':
        return updateCheckUpdate;
      case 'updateDownloadUpdate':
        return updateDownloadUpdate;
      case 'updateNewVersion':
        return updateNewVersion;
      case 'updateApprove':
        return updateApprove;
      case 'updateCheckingUpdate':
        return updateCheckingUpdate;
      case 'updateUpdateFound':
        return updateUpdateFound;
      case 'updateNoUpdateFound':
        return updateNoUpdateFound;
      case 'updateDownloading':
        return updateDownloading;
      case 'updateDownloaded':
        return updateDownloaded;
      case 'updateInstallationTitle':
        return updateInstallationTitle;
      case 'updateInstallationContent':
        return updateInstallationContent;
      case 'updateDirectoryNotFoundTitle':
        return updateDirectoryNotFoundTitle;
      case 'updateDirectoryNotFoundContent':
        return updateDirectoryNotFoundContent;
      case 'updateFileNotFoundTitle':
        return updateFileNotFoundTitle;
      case 'updateFileNotFoundContent':
        return updateFileNotFoundContent;
      default:
        return super[key];
    }
  }
}

class AboutTranslation_fa extends AboutTranslation {
  final Translation_fa _parent;
  const AboutTranslation_fa(this._parent) : super(_parent);
  String get aboutTitlesAppName => "نام برنامه";
  String get aboutTitlesDeveloperName => "نام توسعه دهنده";
  String get aboutTitlesDeveloperWebsite => "وب سایت توسعه دهنده";
  String get aboutTitlesDeveloperLinkedIn => "پروفایل لینکدین توسعه دهنده";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'aboutTitlesAppName':
        return aboutTitlesAppName;
      case 'aboutTitlesDeveloperName':
        return aboutTitlesDeveloperName;
      case 'aboutTitlesDeveloperWebsite':
        return aboutTitlesDeveloperWebsite;
      case 'aboutTitlesDeveloperLinkedIn':
        return aboutTitlesDeveloperLinkedIn;
      default:
        return super[key];
    }
  }
}
