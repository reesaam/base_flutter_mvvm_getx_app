import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../ui_kit/dialogs/app_alert_dialogs.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_resources/page_details.dart';

@GetPut.controller()
class AdminDataFormatCheckController extends CoreController {

  @override
  AppPageDetail get pageDetail => AppPageDetails.adminDataFormatCheckPage;

  functionCalledDialog() => AppAlertDialogs.withOk(text: 'Function Called', onTapOk: popPage);
}
