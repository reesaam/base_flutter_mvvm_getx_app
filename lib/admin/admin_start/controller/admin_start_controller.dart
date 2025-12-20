import 'package:getx_binding_annotation/get_put_annotation.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';

@GetPut.controller()
class AdminStartController extends CoreController {
  List<AppPageDetail> pages = List<AppPageDetail>.empty(growable: true);

  @override
  AppPageDetail get pageDetail => AppPages.adminStartPage;

  @override
  void dataInit() {
    pages = AppPages.listAdminPages;
  }
}
