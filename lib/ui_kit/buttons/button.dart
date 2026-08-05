import '../../barrels/core_resources_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

import 'button_abstraction.dart';
import 'button_constructor.dart';
import 'button_type_enum.dart';

/// Abstraction for [AppButton] to Determine what functions Buttons have without checking the main file.
/// [AppButton] is the Main Widget which creates a general complete Widget of a Buttons with all the parameters
/// [AppButton] extends [AppButtonConstructor] and use [AppButtonAbstraction] Abstraction for two purposes
/// first, for Developer's knowledge of existing factories of the Buttons and what Options do they have
/// and second, is for developing purposes, means if existing AppButton was not enough or complete to Answer Developing needs
/// it can be extended and developed by another widget or any other way of implementation

class AppButton extends AppButtonConstructor implements AppButtonAbstraction {
  const AppButton._({
    required super.buttonType,
    required super.onTap,
    super.backgroundColor,
    super.textColor,
    super.iconColor,
    super.borderColor,
    super.child,
    super.loadingWidget,
    super.text,
    super.icon,
    super.leading,
    super.width,
    super.height,
    super.disabled,
    super.loading,
    super.padding,
    super.margin,
    super.stateController,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
  }) : assert(
          (text == null && icon == null) || (text == null && icon != null) || (text != null && icon != null) || (child == null),
          AppAssertTexts.buttonsCheckNullInputs,
        );

  factory AppButton.general({
    required Function() onTap,
    AppColors? backgroundColor,
    AppColors? borderColor,
    String? text,
    Widget? widget,
    AppIcons? icon,
    AppIcons? leading,
    bool? disabled,
    bool? loading,
  }) =>
      AppButton._(
        buttonType: ButtonType.general,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        onTap: onTap,
        text: text,
        icon: icon,
        leading: leading,
        disabled: disabled,
        loading: loading,
        child: widget,
      );

  factory AppButton.filled({
    required Function() onTap,
    required String text,
    AppColors? backgroundColor,
    AppColors? borderColor,
    Widget? widget,
    AppIcons? icon,
    AppIcons? leading,
    bool? disabled,
    bool? loading,
  }) =>
      AppButton._(
        buttonType: ButtonType.filled,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        onTap: onTap,
        text: text,
        icon: icon,
        leading: leading,
        disabled: disabled,
        loading: loading,
      );

  factory AppButton.outlined({
    required Function() onTap,
    required String text,
    AppColors? borderColor,
    Widget? widget,
    AppIcons? icon,
    AppIcons? leading,
    bool? disabled,
    bool? loading,
  }) =>
      AppButton._(
        buttonType: ButtonType.outlined,
        borderColor: borderColor,
        onTap: onTap,
        text: text,
        icon: icon,
        leading: leading,
        disabled: disabled,
        loading: loading,
        child: widget,
      );

  factory AppButton.icon({
    required AppIcons icon,
    required Function onTap,
    AppColors? backgroundColor,
    AppColors? iconColor,
    AppColors? borderColor,
    String? text,
  }) =>
      AppButton._(
        buttonType: ButtonType.icon,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        onTap: () => onTap,
        icon: icon,
        iconColor: iconColor,
        text: text,
      );
}
