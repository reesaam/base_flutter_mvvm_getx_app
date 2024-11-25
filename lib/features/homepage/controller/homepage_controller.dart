import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/page_details.dart';

@GetPut.controller()
class HomePageController extends CoreController {

  @override
  void pageInit() {
    pageDetail = AppPageDetails.homepage;
  }
}
