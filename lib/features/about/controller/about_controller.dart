import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_info/app_info.dart';
import '../../../core/core_info/developer_info.dart';
import '../../../core/core_resources/page_details.dart';

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
    pageDetail = AppPageDetails.about;
  }

  _fillData() {
    listTitles = List<String>.of([
      Texts.to.aboutTitlesAppName,
      Texts.to.aboutTitlesDeveloperName,
      Texts.to.aboutTitlesDeveloperWebsite,
      Texts.to.aboutTitlesDeveloperLinkedIn,
    ]);

    listItems = List<String>.of([
      AppInfo.appName,
      AppDeveloperInfo.fullName,
      AppDeveloperInfo.website,
      AppDeveloperInfo.linkedin,
    ]);
  }
}
