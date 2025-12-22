import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';

export 'package:get/get.dart';
export 'package:getx_binding_annotation/get_put_annotation.dart';
export 'package:flutter/material.dart';
export 'package:flutter/widgets.dart';

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
