import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_binding_annotation/annotation.dart';

import '../../../core/app_localization.dart';
import '../../../core/core_elements/core_view.dart';
import '../../../core/extensions/extensions_on_data_types/extension_icon.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../controller/not_found_controller.dart';

@GetPut.page(isUnknown: true)
class NotFoundPage extends CoreView<NotFoundController> {
  const NotFoundPage({super.key});

  @override
  Widget get body => Container(
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height - 100,
      child: Stack(children: [
        _widgetMain(),
      ]));

  Widget _widgetMain() => Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        controller.icon.withSize(Get.size.width / 6),
        Text(Texts.to.notFoundPageName),
      ]));
}
