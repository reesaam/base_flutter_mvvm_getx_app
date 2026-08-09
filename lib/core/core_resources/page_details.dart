import '../../barrels/admin_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/shared_models_barrel.dart';
import '../../features/about/view/about_view.dart';
import '../../features/auth/view/login_view.dart';
import '../../features/homepage/view/homepage_view.dart';
import '../../features/not_found/view/not_found_view.dart';
import '../../features/settings/view/settings_view.dart';
import '../../features/splash_screen/view/splash_screen_view.dart';
import '../../features/update/view/update_view.dart';

class AppPages {
  static List<AppPageDetail> get listPages => [
        splashScreen,
        login,
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
    pageName: Texts.to.adminPagesName.adminStartPagePageName,
    pageRoute: _getPageRoute(AdminStartPage),
  );

  static AppPageDetail adminTestPage = AppPageDetail(
    pageName: Texts.to.adminPagesName.adminTestPageName,
    pageRoute: _getPageRoute(AdminTestPage),
  );

  static AppPageDetail adminAppInfoPage = AppPageDetail(
    pageName: Texts.to.adminPagesName.adminAppInfoPageName,
    pageRoute: _getPageRoute(AdminAppInfoPage),
  );

  static AppPageDetail adminAppResourcesPage = AppPageDetail(
    pageName: Texts.to.adminPagesName.adminAppResourcesPageName,
    pageRoute: _getPageRoute(AdminAppResourcesPage),
  );

  static AppPageDetail adminWidgetCheckPage = AppPageDetail(
    pageName: Texts.to.adminPagesName.adminWidgetCheckPageName,
    pageRoute: _getPageRoute(AdminWidgetCheckPage),
  );

  static AppPageDetail adminDataFormatCheckPage = AppPageDetail(
    pageName: Texts.to.adminPagesName.adminDataFormatCheckPageName,
    pageRoute: _getPageRoute(AdminDataFormatCheckPage),
  );

  static AppPageDetail adminVerifiersPage = AppPageDetail(
    pageName: Texts.to.adminPagesName.adminVerifiersPageName,
    pageRoute: _getPageRoute(AdminVerifiersPage),
  );

  static AppPageDetail adminAppCountriesPage = AppPageDetail(
    pageName: Texts.to.adminPagesName.adminAppCountriesPageName,
    pageRoute: _getPageRoute(AdminAppCountriesPage),
  );

  static AppPageDetail appDocs = AppPageDetail(
    pageName: Texts.to.adminPagesName.appDocsPageName,
    pageRoute: _getPageRoute(AppDocsPage),
  );

  ///Main Pages
  static AppPageDetail splashScreen = AppPageDetail(
    pageName: Texts.to.pagesName.splashScreenPageName,
    pageRoute: _getPageRoute(SplashScreenPage),
  );

  static AppPageDetail login = AppPageDetail(
    pageName: 'Login',
    pageRoute: _getPageRoute(LoginPage),
  );

  static AppPageDetail homepage = AppPageDetail(
    pageName: Texts.to.pagesName.homePageName,
    pageRoute: _getPageRoute(HomePage),
    iconCode: AppIcons.home.icon.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  static AppPageDetail settings = AppPageDetail(
    pageName: Texts.to.pagesName.settingsPageName,
    pageRoute: _getPageRoute(SettingsPage),
    iconCode: AppIcons.settings.icon.codePoint,
    bottomBarItemNumber: 1,
    drawerPresence: true,
  );

  static AppPageDetail about = AppPageDetail(
    pageName: Texts.to.pagesName.aboutPageName,
    pageRoute: _getPageRoute(AboutPage),
    iconCode: AppIcons.about.icon.codePoint,
    drawerPresence: true,
  );

  static AppPageDetail update = AppPageDetail(
    pageName: Texts.to.pagesName.updatePageName,
    pageRoute: _getPageRoute(UpdatePage),
    iconCode: AppIcons.update.icon.codePoint,
    drawerPresence: true,
  );

  static AppPageDetail notFound = AppPageDetail(
    pageName: Texts.to.pagesName.notFoundPageName,
    pageRoute: _getPageRoute(NotFoundPage),
  );
}

String _getPageRoute(Type page) => page.route;
