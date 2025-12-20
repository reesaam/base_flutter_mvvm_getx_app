import 'package:get/get.dart';

import '../../components/statistics/statistics.dart';
import '../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../core_resources/defaults.dart';
import '../core_resources/page_details.dart';

goToPage(AppPageDetail? page, {bool? popAll}) {
  page == null
      ? Get.toNamed(AppPages.notFound.pageRoute)
      : popAll == true
          ? Get.offAllNamed(page.pageRoute)
          : Get.toNamed(page.pageRoute);
  AppStatistics.to.increasePageOpens();
}

goToPageWithDelay(AppPageDetail? route, {bool? popAll, int? delayInSeconds}) async {
  await Future.delayed(Duration(seconds: delayInSeconds ?? AppDefaults.transitionDuration.inSeconds));
  goToPage(route);
}
