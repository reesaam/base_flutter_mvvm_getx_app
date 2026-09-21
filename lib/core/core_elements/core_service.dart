import '../../barrels/core_barrel.dart';

abstract class CoreService<T> extends GetxService  {
  void onInitFunction() {}
  void onReadyFunction() {}
  void onCloseFunction() {}

  @override
  void onInit() {
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
