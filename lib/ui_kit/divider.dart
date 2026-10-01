import '../barrels/ui_kit_barrel.dart';

class AppDividers {
  static Widget general({AppColors? color, AppPaddings? padding}) => AppContainer(
    padding: padding,
    child: Divider(color: (color ?? AppColors.primary).color),
  );

  static Widget generalWithInlineText({required String text, AppColors? color}) => Stack(
    alignment: Alignment.center,
    children: [
      general(color: color ?? AppColors.divider),

      /// Exclusion for UI Kit AppContainer
      Container(
        padding: AppPaddings.buttonXLarge,
        color:
            Get.context?.findAncestorWidgetOfExactType<Container>()?.color ??
            Get.context?.findAncestorWidgetOfExactType<Scaffold>()?.backgroundColor ??
            Get.theme.canvasColor,
        child: Text(text).copyWith(textColor: color ?? AppColors.primary),
      ),
    ],
  );

  static Widget get settings => general(color: AppColors.disabled);
}
