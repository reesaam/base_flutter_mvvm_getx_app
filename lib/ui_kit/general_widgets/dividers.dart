import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/extensions/material_widgets_extensions/extension_text.dart';
import '../resources/paddings.dart';
import '../theme/themes.dart';

class AppDividers {
  static Widget general({Color? color}) => Divider(color: color ?? Get.theme.primaryColor);

  static Widget generalWithInlineText({required String text, Color? color}) => Stack(alignment: Alignment.center, children: [
        general(color: color ?? Get.theme.primaryColor),
        Container(
          padding: AppPaddings.buttonXLarge,
          color: Get.context?.findAncestorWidgetOfExactType<Container>()?.color ??
              Get.context?.findAncestorWidgetOfExactType<Scaffold>()?.backgroundColor ??
              Get.theme.canvasColor,
          child: Text(text).withColor(color ?? Get.theme.primaryColor),
        ),
      ]);

  static Widget get generalWithCanvasColor => general(color: Get.theme.canvasColor);

  static Widget get generalWithPrimaryColor => general(color: Get.theme.primaryColor);

  static Widget get generalWithDisabledColor => general(color: Get.theme.disabledColor);

  static Widget get settings => generalWithDisabledColor;
}
