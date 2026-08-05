import '../../barrels/core_resources_barrel.dart';
import '../../barrels/localization_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

import 'app_button_widget.dart';
import 'button_type_enum.dart';
import 'icon_button.dart';

/// General and Complete Widget for [AppButton]
/// All Buttons in the App will generate with this Widget in [AppButton]
/// [AppButton] also uses [AppButtonAbstraction] for Abstraction which has been explained there

class AppButtonConstructor extends BaseWidget {
  const AppButtonConstructor({
    super.key,
    required this.buttonType,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.borderColor,
    this.loadingColor,
    this.loadingWidget,
    this.text,
    this.child,
    this.icon,
    this.leading,
    this.width,
    this.height,
    this.disabled,
    this.loading,
    this.padding,
    this.margin,
    this.stateController,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  final ButtonType buttonType;
  final Function() onTap;
  final AppColors? backgroundColor;
  final AppColors? textColor;
  final AppColors? iconColor;
  final AppColors? borderColor;
  final AppColors? loadingColor;
  final Widget? child;
  final Widget? loadingWidget;
  final String? text;
  final AppIcons? icon;
  final AppIcons? leading;
  final double? width;
  final double? height;
  final bool? disabled;
  final bool? loading;
  final AppPaddings? padding;
  final AppPaddings? margin;
  final WidgetStatesController? stateController;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget get widget {
    Widget widget = AppBox.shrink();
    if (buttonType == ButtonType.icon) {
      widget = AppIconButton(
        icon: icon ?? AppIcons.none,
        iconColor: iconColor,
        onTap: onTap,
        text: text,
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
      width: width,
      height: height,
      padding: padding ?? AppDefaults.buttonPadding,
      margin: margin,
      child: widget,
    );
  }
}
