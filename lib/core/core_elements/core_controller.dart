import '../../barrels/shared_models_barrel.dart';
import '../../barrels/core_barrel.dart';

abstract class CoreController extends GetxController {

  static CoreController get to => Get.find();

  BuildContext context = Get.context!;
  late AppPageDetail pageDetail;

  ///Mandatory Functions
  void dataInit() {}
  void pageInit() {}
  void onInitFunction() {}
  void onReadyFunction() {}
  void onCloseFunction() {}

  @override
  void onInit() {
    dataInit();
    pageInit();
    onInitFunction();
    super.onInit();
  }

  @override
  void onReady() {
    onReadyFunction();
    super.onReady();
  }

  @override
  void onClose() {
    onCloseFunction();
    super.onClose();
  }
}
