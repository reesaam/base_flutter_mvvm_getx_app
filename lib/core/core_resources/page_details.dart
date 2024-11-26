import '../../admin/admin_app_countries/view/admin_app_countries_page.dart';
import '../../admin/admin_app_info/view/admin_app_info_page.dart';
import '../../admin/admin_app_resources/view/admin_app_resources_page.dart';
import '../../admin/admin_data_format_check/view/admin_data_format_check_page.dart';
import '../../admin/admin_start/view/admin_start_page.dart';
import '../../admin/admin_test/view/admin_test_page.dart';
import '../../admin/admin_verifiers/view/admin_verifiers_page.dart';
import '../../admin/admin_widget_check/view/admin_widget_check_page.dart';
import '../../admin/app_docs/view/app_docs_page.dart';
import '../../features/about/view/about_view.dart';
import '../../features/homepage/view/homepage_view.dart';
import '../../features/not_found/view/not_found_view.dart';
import '../../features/settings/view/settings_view.dart';
import '../../features/splash_screen/view/splash_screen_view.dart';
import '../../features/update/view/update_view.dart';
import '../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../app_localization.dart';
import '../extensions/extensions_for_core/extension_app_routes.dart';
import 'icons.dart';

class AppPageDetails {
  static List<AppPageDetail> get listPages => [
        splashScreen,
        homepage,
        settings,
        about,
        update,
        notFound,
      ];

  static List<AppPageDetail> get listAdminPages => [
        adminStartPage,
        adminTestPage,
        adminAppInfoPage,
        adminAppResourcesPage,
        adminWidgetCheckPage,
        adminDataFormatCheckPage,
        adminVerifiersPage,
        adminAppCountriesPage,
        appDocs,
      ];

  ///Admin Pages
  static AppPageDetail adminStartPage = AppPageDetail(
    pageName: Texts.to.adminStartPagePageName,
    pageRoute: _getPageRoute(AdminStartPage),
  );

  static AppPageDetail adminTestPage = AppPageDetail(
    pageName: Texts.to.adminTestPageName,
    pageRoute: _getPageRoute(AdminTestPage),
  );

  static AppPageDetail adminAppInfoPage = AppPageDetail(
    pageName: Texts.to.adminAppInfoPageName,
    pageRoute: _getPageRoute(AdminAppInfoPage),
  );

  static AppPageDetail adminAppResourcesPage = AppPageDetail(
    pageName: Texts.to.adminAppResourcesPageName,
    pageRoute: _getPageRoute(AdminAppResourcesPage),
  );

  static AppPageDetail adminWidgetCheckPage = AppPageDetail(
    pageName: Texts.to.adminWidgetCheckPageName,
    pageRoute: _getPageRoute(AdminWidgetCheckPage),
  );

  static AppPageDetail adminDataFormatCheckPage = AppPageDetail(
    pageName: Texts.to.adminDataFormatCheckPageName,
    pageRoute: _getPageRoute(AdminDataFormatCheckPage),
  );

  static AppPageDetail adminVerifiersPage = AppPageDetail(
    pageName: Texts.to.adminVerifiersPageName,
    pageRoute: _getPageRoute(AdminVerifiersPage),
  );

  static AppPageDetail adminAppCountriesPage = AppPageDetail(
    pageName: Texts.to.adminAppCountriesPageName,
    pageRoute: _getPageRoute(AdminAppCountriesPage),
  );

  static AppPageDetail appDocs = AppPageDetail(
    pageName: Texts.to.appDocsPageName,
    pageRoute: _getPageRoute(AppDocsPage),
  );

  ///Main Pages
  static AppPageDetail splashScreen = AppPageDetail(
    pageName: Texts.to.splashScreenPageName,
    pageRoute: _getPageRoute(SplashScreenPage),
  );

  static AppPageDetail homepage = AppPageDetail(
    pageName: Texts.to.homePageName,
    pageRoute: _getPageRoute(HomePage),
    iconCode: AppIcons.home.icon!.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  static AppPageDetail settings = AppPageDetail(
    pageName: Texts.to.settingsPageName,
    pageRoute: _getPageRoute(SettingsPage),
    iconCode: AppIcons.settings.icon!.codePoint,
    bottomBarItemNumber: 1,
    drawerPresence: true,
  );

  static AppPageDetail about = AppPageDetail(
    pageName: Texts.to.aboutPageName,
    pageRoute: _getPageRoute(AboutPage),
    iconCode: AppIcons.about.icon!.codePoint,
    drawerPresence: true,
  );

  static AppPageDetail update = AppPageDetail(
    pageName: Texts.to.updatePageName,
    pageRoute: _getPageRoute(UpdatePage),
    iconCode: AppIcons.update.icon!.codePoint,
    drawerPresence: true,
  );

  static AppPageDetail notFound = AppPageDetail(
    pageName: Texts.to.notFoundPageName,
    pageRoute: _getPageRoute(NotFoundPage),
  );
}

String _getPageRoute(Type page) => page.route;