import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/services_barrel.dart';

import '../models/about_item_model.dart';

@GetPut.controller()
class AboutController extends CoreController {
  final RxList<AboutItemModel> items = <AboutItemModel>[].obs;

  @override
  void dataInit() async {
    await AppDeviceInfoService.to.ensureReady();
    _fillData();
  }

  @override
  void pageInit() {
    pageDetail = AppPages.about;
  }

  void _fillData() {
    final device = AppDeviceInfoService.to;
    items.assignAll([
      AboutItemModel(title: Texts.to.about.aboutTitlesAppName, value: AppInfo.appName),
      AboutItemModel(title: Texts.to.about.aboutTitlesVersion, value: device.version),
      AboutItemModel(title: Texts.to.about.aboutTitlesBuild, value: device.buildNumber),
      AboutItemModel(title: Texts.to.about.aboutTitlesOs, value: '${device.os} ${device.osVersion}'.trim()),
      AboutItemModel(title: Texts.to.about.aboutTitlesDevice, value: device.deviceModel),
      AboutItemModel(title: Texts.to.about.aboutTitlesLocale, value: device.localeTag),
      AboutItemModel(title: Texts.to.about.aboutTitlesDeveloperName, value: AppDeveloperInfo.fullName),
      AboutItemModel(title: Texts.to.about.aboutTitlesDeveloperWebsite, value: AppDeveloperInfo.website),
      AboutItemModel(title: Texts.to.about.aboutTitlesDeveloperLinkedIn, value: AppDeveloperInfo.linkedin),
    ]);
  }
}
