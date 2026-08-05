import '../../../barrels/annotations_barrel.dart';
import '../../../barrels/core_barrel.dart';
import '../../../barrels/core_elements_barrel.dart';
import '../../../barrels/core_resources_barrel.dart';
import '../../../barrels/localization_barrel.dart';

@GetPut.controller()
class AboutController extends CoreController {
  List<String> listTitles = List.empty(growable: true);
  List<String> listItems = List.empty(growable: true);

  @override
  void dataInit() {
    _fillData();
  }

  @override
  void pageInit() {
    pageDetail = AppPages.about;
  }

  _fillData() {
    listTitles = List<String>.of([
      Texts.to.about.aboutTitlesAppName,
      Texts.to.about.aboutTitlesDeveloperName,
      Texts.to.about.aboutTitlesDeveloperWebsite,
      Texts.to.about.aboutTitlesDeveloperLinkedIn,
    ]);

    listItems = List<String>.of([
      AppInfo.appName,
      AppDeveloperInfo.fullName,
      AppDeveloperInfo.website,
      AppDeveloperInfo.linkedin,
    ]);
  }
}
