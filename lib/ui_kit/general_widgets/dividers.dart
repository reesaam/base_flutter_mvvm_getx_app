import '../../core/extensions/material_widgets_extensions/extension_text.dart';
import '../../core/extensions/theme_extensions/extension_colors.dart';
import '../resources/paddings.dart';
import '../theme/colors.dart';

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

  static Widget get generalWithCanvasColor => general(color: AppColors.canvas.color);

  static Widget get generalWithPrimaryColor => general(color: AppColors.primary.color);

  static Widget get generalWithDisabledColor => general(color: AppColors.disabled.color);

  static Widget get settings => generalWithDisabledColor;
}
