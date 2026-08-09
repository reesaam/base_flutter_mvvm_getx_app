import '../../barrels/components_barrel.dart';
import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/shared_models_barrel.dart';

void goToPage(AppPageDetail? page, {bool? popAll}) {
  page == null
      ? Get.toNamed(AppPages.notFound.pageRoute)
      : popAll == true
          ? Get.offAllNamed(page.pageRoute)
          : Get.toNamed(page.pageRoute);
  AppStatistics.to.increasePageOpens();
}

void goToPageWithDelay(AppPageDetail? route, {bool? popAll, int? delayInSeconds}) async {
  await Future.delayed(Duration(seconds: delayInSeconds ?? AppDefaults.transitionDuration.inSeconds));
  goToPage(route);
}
