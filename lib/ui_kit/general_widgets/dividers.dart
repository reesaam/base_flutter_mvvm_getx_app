import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/extensions/material_widgets_extensions/extension_text.dart';
import '../resources/paddings.dart';
import '../theme/themes.dart';

class AppDividers {
  static Widget general({Color? color}) => Divider(color: color ?? AppThemes.to.theme.primaryColor);

  static Widget generalWithInlineText({required String text, Color? color}) => Stack(alignment: Alignment.center, children: [
        general(color: color ?? AppThemes.to.theme.primaryColor),
        Container(
          padding: AppPaddings.buttonXLarge,
          color: Get.context?.findAncestorWidgetOfExactType<Container>()?.color ??
              Get.context?.findAncestorWidgetOfExactType<Scaffold>()?.backgroundColor ??
              AppThemes.to.theme.canvasColor,
          child: Text(text).withColor(color ?? AppThemes.to.theme.primaryColor),
        ),
      ]);

  static Widget get generalWithCanvasColor => general(color: AppThemes.to.theme.canvasColor);

  static Widget get generalWithPrimaryColor => general(color: AppThemes.to.theme.primaryColor);

  static Widget get generalWithDisabledColor => general(color: AppThemes.to.theme.disabledColor);

  static Widget get settings => generalWithDisabledColor;
}
