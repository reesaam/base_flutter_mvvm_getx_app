import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

import 'button_widget.dart';
import 'button_type_enum.dart';

/// General and Complete Widget for [AppButton]
/// All Buttons in the App will generate with this Widget in [AppButton]
/// [AppButton] also uses [AppButtonAbstraction] for Abstraction which has been explained there

class AppButtonConstructor extends BaseWidget {
  const AppButtonConstructor({
    super.key,
    required this.buttonType,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.loadingColor,
    this.child,
    this.text,
    this.textColor,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.leading,
    this.size,
    this.disabled,
    this.loading,
    this.loadingWidget,
    this.padding,
    this.margin,
    this.stateController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  }) : assert(
         (text == null && icon == null) || (text == null && icon != null) || (text != null && icon != null) || (child == null),
         AppAssertTexts.buttonsCheckNullInputs,
       );

  final ButtonType buttonType;
  final Function() onTap;
  final AppColors? backgroundColor;
  final AppColors? borderColor;
  final AppColors? loadingColor;
  final Widget? child;
  final String? text;
  final AppColors? textColor;
  final AppIcons? icon;
  final AppColors? iconColor;
  final double? iconSize;
  final AppIcons? leading;
  final Size? size;
  final bool? disabled;
  final bool? loading;
  final Widget? loadingWidget;
  final AppPaddings? padding;
  final AppPaddings? margin;
  final WidgetStatesController? stateController;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget get widget {
    Widget widget = AppBox.shrink();
    if (buttonType == ButtonType.icon) {
      // widget = AppIconButton(
      //   icon: icon ?? AppIcons.none,
      //   iconColor: iconColor,
      //   iconSize: iconSize,
      //   onTap: onTap,
      //   text: text,
      // );
      widget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(icon?.icon), if (text.isNotNullOrEmpty) Text(text ?? '').withColor(iconColor?.color)],
      );
    } else {
      widget = AppButtonWidget(
        backgroundColor: buttonType.backgroundColor,
        borderColor: borderColor,
        textColor: buttonType.textColor,
        text: text ?? Texts.to.general.notAvailableInitials,
        onTap: onTap,
        icon: icon,
        leading: leading,
        disabled: disabled,
        loading: loading,
      );
    }
    return AppContainer(
      color: backgroundColor ?? AppColors.transparent,
      decoration: AppElements.boxDecorationDefault,
      alignment: Alignment.center,
      width: buttonType == ButtonType.icon ? AppDefaults.appbarIconButtonHeight : size?.width ?? double.maxFinite,
      height: size?.height ?? AppDefaults.buttonsGeneralHeight,
      padding: padding ?? AppDefaults.buttonPadding,
      margin: margin,
      child: widget,
    );
  }
}
