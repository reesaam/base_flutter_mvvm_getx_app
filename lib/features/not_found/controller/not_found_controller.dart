import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/icons.dart';
import '../../../core/core_resources/page_details.dart';

@GetPut.controller()
class NotFoundController extends CoreController {
  late Icon icon;

  @override
  void pageInit() {
    pageDetail = AppPages.notFound;
    icon = AppIcons.notFound;
  }
}
