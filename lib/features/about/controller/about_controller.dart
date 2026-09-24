import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';
import '../../../barrels/services_barrel.dart';

@GetPut.controller()
class AboutController extends CoreController {
  final RxList<String> listTitles = List<String>.empty(growable: true).obs;
  final RxList<String> listItems = List<String>.empty(growable: true).obs;

  @override
  void dataInit() async {
    await AppDeviceInfoService.to.ensureReady();
    _fillData();
  }

  @override
  void pageInit() {
    pageDetail = AppPages.about;
  }

  _fillData() {
    final device = AppDeviceInfoService.to;
    listTitles.assignAll([
      Texts.to.about.aboutTitlesAppName,
      Texts.to.about.aboutTitlesVersion,
      Texts.to.about.aboutTitlesBuild,
      Texts.to.about.aboutTitlesOs,
      Texts.to.about.aboutTitlesDevice,
      Texts.to.about.aboutTitlesLocale,
      Texts.to.about.aboutTitlesDeveloperName,
      Texts.to.about.aboutTitlesDeveloperWebsite,
      Texts.to.about.aboutTitlesDeveloperLinkedIn,
    ]);

    listItems.assignAll([
      AppInfo.appName,
      device.version,
      device.buildNumber,
      '${device.os} ${device.osVersion}'.trim(),
      device.deviceModel,
      device.localeTag,
      AppDeveloperInfo.fullName,
      AppDeveloperInfo.website,
      AppDeveloperInfo.linkedin,
    ]);
  }
}
