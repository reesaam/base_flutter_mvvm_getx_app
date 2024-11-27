// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

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

class Translation implements i69n.I69nMessageBundle {
  const Translation();
  LanguageTranslation get language => LanguageTranslation(this);
  AppTranslation get app => AppTranslation(this);
  PagesNameTranslation get pagesName => PagesNameTranslation(this);
  AdminPagesNameTranslation get adminPagesName =>
      AdminPagesNameTranslation(this);
  GeneralTranslation get general => GeneralTranslation(this);
  DialogsTranslation get dialogs => DialogsTranslation(this);
  ConnectionTranslation get connection => ConnectionTranslation(this);
  SettingsTranslation get settings => SettingsTranslation(this);
  UpdateTranslation get update => UpdateTranslation(this);
  AboutTranslation get about => AboutTranslation(this);
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
        return key;
    }
  }
}

class LanguageTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const LanguageTranslation(this._parent);
  String get languageName => "English";
  String get languageCode => "en_US";
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
        return key;
    }
  }
}

class AppTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const AppTranslation(this._parent);
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
        return key;
    }
  }
}

class PagesNameTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const PagesNameTranslation(this._parent);
  String get splashScreenPageName => "Splash Screen";
  String get homePageName => "Home";
  String get settingsPageName => "Settings";
  String get updatePageName => "Update";
  String get aboutPageName => "About";
  String get notFoundPageName => "Page Not Found";
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
        return key;
    }
  }
}

class AdminPagesNameTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const AdminPagesNameTranslation(this._parent);
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
        return key;
    }
  }
}

class GeneralTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const GeneralTranslation(this._parent);
  String get empty => "null";
  String get dash => "-";
  String get version => "Version";
  String get ok => "Ok";
  String get cancel => "Cancel";
  String get yes => "Yes";
  String get no => "No";
  String get notAvailable => "Not Available";
  String get notAvailableInitials => "N/A";
  String get total => "Total";
  String get from => "From";
  String get to => "To";
  String get warning => "Warning";
  String get alert => "Alert";
  String get information => "Information";
  String get info => "Info";
  String get incorrect => "Incorrect";
  String get totalBalance => "Total Balance";
  String get appExit => "App Exit";
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
        return key;
    }
  }
}

class DialogsTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const DialogsTranslation(this._parent);
  String get areYouSure => "Are you sure ?";
  String get areYouSureDataWillLost =>
      "${areYouSure}\nData will be lost with this Function.";
  String get areYouSureDataMayLost =>
      "${areYouSure}\nData may be lost with this Function.";
  String get areYouSureDataExport =>
      "${areYouSure}\nData will be exported and exposed.";
  String get areYouSureDataImport =>
      "${areYouSure}\nData will be imported and exposed.";
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
        return key;
    }
  }
}

class ConnectionTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const ConnectionTranslation(this._parent);
  String get connectionInternetNotAvailableTitle => "Internet Connection";
  String get connectionInternetNotAvailableText =>
      "Internet Connection is not Available!\nPlease Check your Connection.";
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
        return key;
    }
  }
}

class SettingsTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const SettingsTranslation(this._parent);
  String get settingsLanguageModalSelectLanguage => "Select Language";
  String get settingsAppbarMenuResetSettings => "Reset All Settings";
  String get settingsSectionTitleGeneral => "General";
  String get settingsSectionTitleGeneralLanguage => "Language";
  String get settingsSectionTitleGeneralCalendar => "Calendar Type";
  String get settingsSectionGeneralItemDarkMode => "Dark Mode";
  String get settingsSectionTitleUpdate => "Update";
  String get settingsSectionTitleUpdateCurrentVersion => "Current Version";
  String get settingsSectionTitleUpdateAvailableVersion => "Available Version";
  String get settingsSectionTitleBackup => "Backup";
  String get settingsSectionBackupBackup => "Backup Data";
  String get settingsSectionBackupRestore => "Restore Data";
  String get settingsSectionTitleStorage => "Storage";
  String get settingsSectionStorageItemEraseAllData => "Erase All Data";
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
        return key;
    }
  }
}

class UpdateTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const UpdateTranslation(this._parent);
  String get updateCurrentVersion => "Current Version";
  String get updateAvailableVersion => "New Available Version";
  String get updateCheckUpdate => "Check Update";
  String get updateDownloadUpdate => "Download Update";
  String get updateNewVersion => "New Version Found";
  String get updateApprove => "Do you want to download the New Version?";
  String get updateCheckingUpdate => "Checking for any Available Update ...";
  String get updateUpdateFound => "New Update is Available!";
  String get updateNoUpdateFound => "There is not any Update Available!";
  String get updateDownloading => "Downloading ...";
  String get updateDownloaded => "Update Downloaded!";
  String get updateInstallationTitle => "Update Installation";
  String get updateInstallationContent =>
      "Do you want to install the Update?\n\nWarning: Application will close!";
  String get updateDirectoryNotFoundTitle => "Directory Error!";
  String get updateDirectoryNotFoundContent =>
      "There is not any Directory available to store Data";
  String get updateFileNotFoundTitle => "File Error!";
  String get updateFileNotFoundContent => "File not found";
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
        return key;
    }
  }
}

class AboutTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const AboutTranslation(this._parent);
  String get aboutTitlesAppName => "App Name";
  String get aboutTitlesDeveloperName => "Developer Name";
  String get aboutTitlesDeveloperWebsite => "Developer WebSite";
  String get aboutTitlesDeveloperLinkedIn => "Developer LinkedIn Profile";
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
        return key;
    }
  }
}
