import '../../barrels/shared_models_barrel.dart';
import '../../barrels/core_barrel.dart';

abstract class CoreController<T> extends GetxController {
  /// Prefer this over storing [Get.context] at construction time.
  BuildContext? get contextOrNull => Get.context;

  BuildContext get context {
    final ctx = Get.context;
    if (ctx == null) {
      throw StateError('BuildContext is not available yet. Access context after the widget tree is mounted.');
    }
    return ctx;
  }

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
