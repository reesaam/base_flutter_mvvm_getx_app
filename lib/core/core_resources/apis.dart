import '../core_info/app_info.dart';
import 'core_enums.dart';

///
/// All APIs URls are gathering here in [AppAPIs] to have the best changing performance
/// You can use [_apiBaseUrl] for the Base for all, it means the base url of the business website
/// Use [_apiVersion] for determine the version of api and it could be easily changed
/// [_apiUrl] is the generated API URl that you can use for APIS here, the every API will be used in the App
///
/// If every [Section] has specific URL part, you can specify a url for them, then use for several APIs in that Section
/// Then API URLs will generate for every API and you use them all over the App
///

class AppAPIs {
  /// [Main Variables] for generating APIs are:
  // static String get _apiBaseUrl => '${AppInfo.subDomain}.${AppInfo.baseUrl}';
  static String get _apiBaseUrl => 'www.${AppInfo.baseUrl}/${AppInfo.subDomain}';
  static String get _apiVersion => APIVersions.v1.getValue;
  static String get _apiUrl => 'https://$_apiBaseUrl/$_apiVersion';

  /// Defining [Sections]
  //Sections
  static String get _apiSectionVersion => '$_apiUrl/${APISections.versions.getName}';
  static String get _apiSectionUpdate => '$_apiUrl/${APISections.update.getName}';

  /// [Sections]:
  //Version
  static String get apiGetVersions => '$_apiSectionVersion/get_versions';

  //Update
  static String get apiGetUpdateAddress => '$_apiSectionUpdate/get_download_address';
  static String get apiGetUpdateAPKDownload => '$apiGetUpdateAddress/${AppInfo.fileNameAPK}';
}
