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
  SettingsTranslation get settings => SettingsTranslation(this);
  UpdateTranslation get update => UpdateTranslation(this);
  ErrorTranslation get error => ErrorTranslation(this);
  StorageTranslation get storage => StorageTranslation(this);
  NetworkTranslation get network => NetworkTranslation(this);
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
      case 'settings':
        return settings;
      case 'update':
        return update;
      case 'error':
        return error;
      case 'storage':
        return storage;
      case 'network':
        return network;
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
  GeneralDialogsTranslation get general => GeneralDialogsTranslation(this);
  DataDialogsTranslation get data => DataDialogsTranslation(this);
  ConnectionDialogsTranslation get connection =>
      ConnectionDialogsTranslation(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'general':
        return general;
      case 'data':
        return data;
      case 'connection':
        return connection;
      default:
        return key;
    }
  }
}

class GeneralDialogsTranslation implements i69n.I69nMessageBundle {
  final DialogsTranslation _parent;
  const GeneralDialogsTranslation(this._parent);
  String get areYouSure => "Are you sure ?";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'areYouSure':
        return areYouSure;
      default:
        return key;
    }
  }
}

class DataDialogsTranslation implements i69n.I69nMessageBundle {
  final DialogsTranslation _parent;
  const DataDialogsTranslation(this._parent);
  String get areYouSureDataWillLost =>
      "${_parent.general.areYouSure}\nData will be lost with this Function.";
  String get areYouSureDataMayLost =>
      "${_parent.general.areYouSure}\nData may be lost with this Function.";
  String get areYouSureDataExport =>
      "${_parent.general.areYouSure}\nData will be exported and exposed.";
  String get areYouSureDataImport =>
      "${_parent.general.areYouSure}\nData will be imported and exposed.";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
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

class ConnectionDialogsTranslation implements i69n.I69nMessageBundle {
  final DialogsTranslation _parent;
  const ConnectionDialogsTranslation(this._parent);
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
  String get languageModalSelectLanguage => "Select Language";
  String get appbarMenuResetSettings => "Reset All Settings";
  String get sectionTitleGeneral => "General";
  String get sectionTitleGeneralLanguage => "Language";
  String get sectionTitleGeneralCalendar => "Calendar Type";
  String get sectionGeneralItemDarkMode => "Dark Mode";
  String get sectionTitleUpdate => "Update";
  String get sectionTitleUpdateCurrentVersion => "Current Version";
  String get sectionTitleUpdateAvailableVersion => "Available Version";
  String get sectionTitleBackup => "Backup";
  String get sectionBackupBackup => "Backup Data";
  String get sectionBackupRestore => "Restore Data";
  String get sectionTitleStorage => "Storage";
  String get sectionStorageItemEraseAllData => "Erase All Data";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'languageModalSelectLanguage':
        return languageModalSelectLanguage;
      case 'appbarMenuResetSettings':
        return appbarMenuResetSettings;
      case 'sectionTitleGeneral':
        return sectionTitleGeneral;
      case 'sectionTitleGeneralLanguage':
        return sectionTitleGeneralLanguage;
      case 'sectionTitleGeneralCalendar':
        return sectionTitleGeneralCalendar;
      case 'sectionGeneralItemDarkMode':
        return sectionGeneralItemDarkMode;
      case 'sectionTitleUpdate':
        return sectionTitleUpdate;
      case 'sectionTitleUpdateCurrentVersion':
        return sectionTitleUpdateCurrentVersion;
      case 'sectionTitleUpdateAvailableVersion':
        return sectionTitleUpdateAvailableVersion;
      case 'sectionTitleBackup':
        return sectionTitleBackup;
      case 'sectionBackupBackup':
        return sectionBackupBackup;
      case 'sectionBackupRestore':
        return sectionBackupRestore;
      case 'sectionTitleStorage':
        return sectionTitleStorage;
      case 'sectionStorageItemEraseAllData':
        return sectionStorageItemEraseAllData;
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

class ErrorTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const ErrorTranslation(this._parent);
  String get unknown => "Unknown Error Occurred";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'unknown':
        return unknown;
      default:
        return key;
    }
  }
}

class StorageTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const StorageTranslation(this._parent);
  String get exceptionNull => "Null Exception";
  String get exceptionLoadData => "Storage Load Data Exception";
  String get exceptionSaveData => "Storage Save Data Exception";
  String get exceptionNodata => "No Data Found";
  String get exceptionUnknown => "Unknown Storage Error";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'exceptionNull':
        return exceptionNull;
      case 'exceptionLoadData':
        return exceptionLoadData;
      case 'exceptionSaveData':
        return exceptionSaveData;
      case 'exceptionNodata':
        return exceptionNodata;
      case 'exceptionUnknown':
        return exceptionUnknown;
      default:
        return key;
    }
  }
}

class NetworkTranslation implements i69n.I69nMessageBundle {
  final Translation _parent;
  const NetworkTranslation(this._parent);
  ConnectionNetworkTranslation get connection =>
      ConnectionNetworkTranslation(this);
  ApiNetworkTranslation get api => ApiNetworkTranslation(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'connection':
        return connection;
      case 'api':
        return api;
      default:
        return key;
    }
  }
}

class ConnectionNetworkTranslation implements i69n.I69nMessageBundle {
  final NetworkTranslation _parent;
  const ConnectionNetworkTranslation(this._parent);
  String get internetNotAvailable => "Internet Not Available Exception";
  String get exceptionTimeout => "Timeout Exception";
  String get exceptionSocket => "Socket Exception";
  String get exceptionHttp => "HTTP Exception";
  String get exceptionFormat => "Format Exception";
  String get exceptionAccess => "Format Exception";
  String get exceptionUnknown => "Unknown Network Error";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'internetNotAvailable':
        return internetNotAvailable;
      case 'exceptionTimeout':
        return exceptionTimeout;
      case 'exceptionSocket':
        return exceptionSocket;
      case 'exceptionHttp':
        return exceptionHttp;
      case 'exceptionFormat':
        return exceptionFormat;
      case 'exceptionAccess':
        return exceptionAccess;
      case 'exceptionUnknown':
        return exceptionUnknown;
      default:
        return key;
    }
  }
}

class ApiNetworkTranslation implements i69n.I69nMessageBundle {
  final NetworkTranslation _parent;
  const ApiNetworkTranslation(this._parent);
  String get exceptionParsingData => "Parsing Data Exception";
  String get exceptionNonAuthoritativeInformation =>
      "NonAuthoritative Information Exception";
  String get exceptionNoContent => "No Content Exception";
  String get exceptionNotModified => "Not Modified Exception";
  String get exceptionUnauthorized => "Unauthorized Exception";
  String get exceptionPaymentRequired => "Payment Required Exception";
  String get exceptionForbidden => "Forbidden Exception";
  String get exceptionNotFound => "Not Found Exception";
  String get exceptionMethodNotAllowed => "Method Not Allowed Exception";
  String get exceptionNotAcceptable => "Not Acceptable Exception";
  String get exceptionProxyAuthRequired => "Proxy Auth Required Exception";
  String get exceptionRequestTimeout => "Request Timeout Exception";
  String get exceptionConflict => "Conflict Exception";
  String get exceptionLengthRequired => "Length Required Exception";
  String get exceptionPreConditionFailed => "PreCondition Failed Exception";
  String get exceptionRequestEntityTooLarge =>
      "Request Entity Too Large Exception";
  String get exceptionRequestUriTooLong => "Request Uri Too Long Exception";
  String get exceptionUnsupportedMediaType =>
      "Unsupported Media Type Exception";
  String get exceptionRequestedRangeNotSatisfiable =>
      "Requested Range Not Satisfiable Exception";
  String get exceptionExpectationFailed => "Expectation FailedException";
  String get exceptionUnProcessableEntity => "UnProcessable Entity Exception";
  String get exceptionFailedDependency => "Failed Dependency Exception";
  String get exceptionUnorderedCollection => "Unordered Collection Exception";
  String get exceptionUpgradeRequired => "Upgrade Required Exception";
  String get exceptionTooManyRequest => "Too Many Request Exception";
  String get exceptionRequestHeaderFieldsTooLarge =>
      "Request Header Fields Too Large Exception";
  String get exceptionNoResponse => "No Response Exception";
  String get exceptionUnavailableForLegalReasons =>
      "Unavailable For Legal Reasons Exception";
  String get exceptionRequestHeaderTooLarge =>
      "Request Header Too Large Exception";
  String get exceptionInternalServerError => "Internal Server Error Exception";
  String get exceptionNotImplemented => "Not Implemented Exception";
  String get exceptionBadGateway => "Bad Gateway Exception";
  String get exceptionServiceUnavailable => "Service Unavailable Exception";
  String get exceptionGatewayTimeout => "Gateway Timeout Exception";
  String get exceptionInsufficientStorage => "Insufficient Storage Exception";
  String get exceptionLoopDetected => "Loop Detected Exception";
  String get exceptionBandwidthLimit => "Bandwidth Limit Exception";
  String get exceptionNotExtended => "Not Extended Exception";
  String get exceptionNetworkAuthRequired => "Network AuthRequired Exception";
  String get exceptionUnknown => "Unknown Network Error";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'exceptionParsingData':
        return exceptionParsingData;
      case 'exceptionNonAuthoritativeInformation':
        return exceptionNonAuthoritativeInformation;
      case 'exceptionNoContent':
        return exceptionNoContent;
      case 'exceptionNotModified':
        return exceptionNotModified;
      case 'exceptionUnauthorized':
        return exceptionUnauthorized;
      case 'exceptionPaymentRequired':
        return exceptionPaymentRequired;
      case 'exceptionForbidden':
        return exceptionForbidden;
      case 'exceptionNotFound':
        return exceptionNotFound;
      case 'exceptionMethodNotAllowed':
        return exceptionMethodNotAllowed;
      case 'exceptionNotAcceptable':
        return exceptionNotAcceptable;
      case 'exceptionProxyAuthRequired':
        return exceptionProxyAuthRequired;
      case 'exceptionRequestTimeout':
        return exceptionRequestTimeout;
      case 'exceptionConflict':
        return exceptionConflict;
      case 'exceptionLengthRequired':
        return exceptionLengthRequired;
      case 'exceptionPreConditionFailed':
        return exceptionPreConditionFailed;
      case 'exceptionRequestEntityTooLarge':
        return exceptionRequestEntityTooLarge;
      case 'exceptionRequestUriTooLong':
        return exceptionRequestUriTooLong;
      case 'exceptionUnsupportedMediaType':
        return exceptionUnsupportedMediaType;
      case 'exceptionRequestedRangeNotSatisfiable':
        return exceptionRequestedRangeNotSatisfiable;
      case 'exceptionExpectationFailed':
        return exceptionExpectationFailed;
      case 'exceptionUnProcessableEntity':
        return exceptionUnProcessableEntity;
      case 'exceptionFailedDependency':
        return exceptionFailedDependency;
      case 'exceptionUnorderedCollection':
        return exceptionUnorderedCollection;
      case 'exceptionUpgradeRequired':
        return exceptionUpgradeRequired;
      case 'exceptionTooManyRequest':
        return exceptionTooManyRequest;
      case 'exceptionRequestHeaderFieldsTooLarge':
        return exceptionRequestHeaderFieldsTooLarge;
      case 'exceptionNoResponse':
        return exceptionNoResponse;
      case 'exceptionUnavailableForLegalReasons':
        return exceptionUnavailableForLegalReasons;
      case 'exceptionRequestHeaderTooLarge':
        return exceptionRequestHeaderTooLarge;
      case 'exceptionInternalServerError':
        return exceptionInternalServerError;
      case 'exceptionNotImplemented':
        return exceptionNotImplemented;
      case 'exceptionBadGateway':
        return exceptionBadGateway;
      case 'exceptionServiceUnavailable':
        return exceptionServiceUnavailable;
      case 'exceptionGatewayTimeout':
        return exceptionGatewayTimeout;
      case 'exceptionInsufficientStorage':
        return exceptionInsufficientStorage;
      case 'exceptionLoopDetected':
        return exceptionLoopDetected;
      case 'exceptionBandwidthLimit':
        return exceptionBandwidthLimit;
      case 'exceptionNotExtended':
        return exceptionNotExtended;
      case 'exceptionNetworkAuthRequired':
        return exceptionNetworkAuthRequired;
      case 'exceptionUnknown':
        return exceptionUnknown;
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
