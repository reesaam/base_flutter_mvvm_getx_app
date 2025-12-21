import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';

@GetPut.controller()
class AdminAppResourcesController extends CoreController {

  @override
  AppPageDetail get pageDetail => AppPages.adminAppResourcesPage;
}
