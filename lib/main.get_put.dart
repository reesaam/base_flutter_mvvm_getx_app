// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// CodeGenerator
// **************************************************************************

library;

/// ///  GENERATED CODE - DO NOT MODIFY BY HAND EVER

///  Dependencies binding annotation generator for [ GetX State Manager ]
///  This file will provide mandatory dependencies for [ GetMaterialApp ]
///    Including:
///      - Pages
///      - Injected Dependencies:
///        - Controllers
///        - Components
///        - Repositories

///  Generator will generate a file with '.get_put.dart' format in the lib/ root fot using in 'main.dart'
///  You can see how to use the generated class in the main in the GetMaterialApp as [example]

///  Package:
///    Package Last Version: [ 1.0.0 ]
///    Package Name: [ getx_binding_annotation_generator ]
///    Package Description: [ Getx Dependencies Binding Annotation Generator ]
///    Package Address: [ ** Will Add in Next Update after First Publish ** ]
///    Package GitHubRepositoryAddress: [ https://github.com/reesaam/flutter_getx_dependencies_binding_annotation ]

///  Written and Provided by:
///    [ Resam Taghipour ]
///    Email: [ resam.t@gmail.com ]
///    Website: [ https://www.resam-t.ir ]
///    LinkedIn: [ https://www.linkedin.com/in/resam ]
///    GitHub: [ https://github.com/reesaam ]

import 'package:get/get.dart';
import 'main.dart';
import 'admin/admin_app_countries/controller/admin_app_countries_controller.dart';
import 'admin/admin_app_countries/view/admin_app_countries_page.dart';
import 'admin/admin_app_info/controller/admin_app_info_controller.dart';
import 'admin/admin_app_info/view/admin_app_info_page.dart';
import 'admin/admin_app_resources/view/admin_app_resources_page.dart';
import 'admin/admin_app_resources/controller/admin_app_resources_controller.dart';
import 'admin/admin_data_format_check/controller/admin_data_format_check_controller.dart';
import 'admin/admin_data_format_check/view/admin_data_format_check_page.dart';
import 'admin/admin_start/controller/admin_start_controller.dart';
import 'admin/admin_start/view/admin_start_page.dart';
import 'admin/admin_test/view/admin_test_page.dart';
import 'admin/admin_verifiers/controller/admin_verifiers_controller.dart';
import 'admin/admin_verifiers/view/admin_verifiers_page.dart';
import 'admin/admin_test/controller/admin_test_controller.dart';
import 'admin/admin_widget_check/controller/admin_widget_check_controller.dart';
import 'admin/admin_widget_check/view/admin_widget_check_page.dart';
import 'components/connectivity/connectivity.dart';
import 'components/failures/local_exception.dart';
import 'components/failures/network_exception.dart';
import 'components/file_functions/file_functions.dart';
import 'components/network/dio.dart';
import 'components/notifications/local_notifications/local_notifications.dart';
import 'components/notifications/local_notifications/local_notification_controller.dart';
import 'components/share/share.dart';
import 'components/permissions/permissions.dart';
import 'components/statistics/statistics.dart';
import 'components/storage/app_storage_module.dart';
import 'components/storage/storage_providers/app_local_storage.dart';
import 'components/storage/storage_providers/app_shared_preferences.dart';
import 'features/about/controller/about_controller.dart';
import 'features/about/view/about_view.dart';
import 'features/homepage/controller/homepage_controller.dart';
import 'features/homepage/view/homepage_view.dart';
import 'features/not_found/controller/not_found_controller.dart';
import 'features/not_found/view/not_found_view.dart';
import 'features/settings/controller/settings_controller.dart';
import 'features/settings/view/settings_view.dart';
import 'features/splash_screen/controller/splash_screen_controller.dart';
import 'features/splash_screen/view/splash_screen_view.dart';
import 'features/update/controller/update_controller.dart';
import 'features/update/data/update_remote_data_source.dart';
import 'features/update/view/update_view.dart';
import 'localization/localizations.dart';
import 'features/versions/data/versions_local_data_source.dart';
import 'features/versions/data/versions_remote_data_source.dart';
import 'ui_kit/theme/themes.dart';

/// Generated Library Statistics:
///   Imports Count: 46
///   Pages Count: 14
///   Controllers Count: 15
///   Components Count: 14
///   Repositories Count: 3

class GetPutPages {
  static List<GetPage> get pages => [
        GetPage(
            name: '/AdminAppCountriesPage', page: AdminAppCountriesPage.new),
        GetPage(name: '/AdminAppInfoPage', page: AdminAppInfoPage.new),
        GetPage(
            name: '/AdminAppResourcesPage', page: AdminAppResourcesPage.new),
        GetPage(
            name: '/AdminDataFormatCheckPage',
            page: AdminDataFormatCheckPage.new),
        GetPage(name: '/AdminStartPage', page: AdminStartPage.new),
        GetPage(name: '/AdminTestPage', page: AdminTestPage.new),
        GetPage(name: '/AdminVerifiersPage', page: AdminVerifiersPage.new),
        GetPage(name: '/AdminWidgetCheckPage', page: AdminWidgetCheckPage.new),
        GetPage(name: '/AboutPage', page: AboutPage.new),
        GetPage(name: '/HomePage', page: HomePage.new),
        GetPage(name: '/NotFoundPage', page: NotFoundPage.new),
        GetPage(name: '/SettingsPage', page: SettingsPage.new),
        GetPage(name: '/SplashScreenPage', page: SplashScreenPage.new),
        GetPage(name: '/UpdatePage', page: UpdatePage.new),
      ];
  static GetPage get initialRoute =>
      GetPage(name: '/SplashScreenPage', page: SplashScreenPage.new);
  static GetPage get unknownRoute =>
      GetPage(name: '/NotFoundPage', page: NotFoundPage.new);
}

class GetPutBindings implements Bindings {
  @override
  void dependencies() {
    _GetPutController().dependencies();
    _GetPutComponent().dependencies();
    _GetPutRepository().dependencies();
  }
}

class _GetPutController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAppCountriesController>(
        () => AdminAppCountriesController(),
        fenix: true);
    Get.lazyPut<AdminAppInfoController>(() => AdminAppInfoController(),
        fenix: true);
    Get.lazyPut<AdminAppResourcesController>(
        () => AdminAppResourcesController(),
        fenix: true);
    Get.lazyPut<AdminDataFormatCheckController>(
        () => AdminDataFormatCheckController(),
        fenix: true);
    Get.lazyPut<AdminStartController>(() => AdminStartController(),
        fenix: true);
    Get.lazyPut<AdminVerifiersController>(() => AdminVerifiersController(),
        fenix: true);
    Get.lazyPut<AdminTestController>(() => AdminTestController(), fenix: true);
    Get.lazyPut<AdminWidgetCheckController>(() => AdminWidgetCheckController(),
        fenix: true);
    Get.lazyPut<AppLocalNotificationController>(
        () => AppLocalNotificationController(),
        fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<NotFoundController>(() => NotFoundController(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(),
        fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
  }
}

class _GetPutComponent extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppConnectionChecker>(() => AppConnectionChecker(),
        fenix: true);
    Get.lazyPut<LocalException>(() => LocalException(), fenix: true);
    Get.lazyPut<NetworkException>(() => NetworkException(), fenix: true);
    Get.lazyPut<AppFileFunctions>(() => AppFileFunctions(), fenix: true);
    Get.lazyPut<DioCore>(() => DioCore(), fenix: true);
    Get.lazyPut<AppLocalNotifications>(() => AppLocalNotifications(),
        fenix: true);
    Get.lazyPut<AppShare>(() => AppShare(), fenix: true);
    Get.lazyPut<AppPermissions>(() => AppPermissions(), fenix: true);
    Get.lazyPut<AppStatistics>(() => AppStatistics(), fenix: true);
    Get.lazyPut<AppStorage>(() => AppStorage(), fenix: true);
    Get.lazyPut<AppLocalStorage>(() => AppLocalStorage(), fenix: true);
    Get.lazyPut<AppSharedPreferences>(() => AppSharedPreferences(),
        fenix: true);
    Get.lazyPut<AppLocalizations>(() => AppLocalizations(), fenix: true);
    Get.lazyPut<AppThemes>(() => AppThemes(), fenix: true);
  }
}

class _GetPutRepository extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateRemoteDataSource>(() => UpdateRemoteDataSource(),
        fenix: true);
    Get.lazyPut<VersionsLocalDataSource>(() => VersionsLocalDataSource(),
        fenix: true);
    Get.lazyPut<VersionsRemoteDataSource>(() => VersionsRemoteDataSource(),
        fenix: true);
  }
}
