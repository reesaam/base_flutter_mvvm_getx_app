import 'package:get/get.dart';

import '../../components/statistics/statistics.dart';
import '../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../core_resources/defaults.dart';
import '../core_resources/page_details.dart';

///Admin Pages
gotoAdminStartPage() => goToPage(AppPageDetails.adminStartPage);
gotoAdminTestPage() => goToPage(AppPageDetails.adminTestPage);
gotoAdminAppInfoPage() => goToPage(AppPageDetails.adminAppInfoPage);
gotoAdminAppResourcesPage() => goToPage(AppPageDetails.adminAppResourcesPage);
gotoAdminWidgetCheckPage() => goToPage(AppPageDetails.adminWidgetCheckPage);
gotoAdminDataFormatCheckPage() => goToPage(AppPageDetails.adminDataFormatCheckPage);
gotoAdminVerifiersPage() => goToPage(AppPageDetails.adminVerifiersPage);
gotoAdminAppCountriesPage() => goToPage(AppPageDetails.adminAppCountriesPage);

///App Pages
goToSplashScreenPage({bool? popAll}) => goToPage(AppPageDetails.splashScreen);
goToHomePage({bool? popAll}) => goToPage(AppPageDetails.homepage);
goToSettingsPage({bool? popAll}) => goToPage(AppPageDetails.settings);
goToUpdatePage({bool? popAll}) => goToPage(AppPageDetails.update);
goToAboutPage({bool? popAll}) => goToPage(AppPageDetails.about);

goToPage(AppPageDetail? page, {bool? popAll}) {
  page == null
      ? Get.toNamed(AppPageDetails.notFound.pageRoute)
      : popAll == true
          ? Get.offAllNamed(page.pageRoute)
          : Get.toNamed(page.pageRoute);
  AppStatistics.to.increasePageOpens();
}

goToPageWithDelay(AppPageDetail? route, {bool? popAll, int? delayInSeconds}) async {
  await Future.delayed(Duration(seconds: delayInSeconds ?? appDefaultPageTransitionDelay));
  goToPage(route);
}
