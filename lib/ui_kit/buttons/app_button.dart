import '../../barrels/ui_kit_barrel.dart';

import 'app_button_abstraction.dart';
import 'app_button_constructor.dart';

/// Abstraction for [AppButton] to Determine what functions Buttons have without checking the main file.
/// [AppButton] is the Main Widget which creates a general complete Widget of a Buttons with all the parameters
/// [AppButton] extends [AppButtonConstructor] and use [AppButtonAbstraction] Abstraction for two purposes
/// first, for Developer's knowledge of existing factories of the Buttons and what Options do they have
/// and second, is for developing purposes, means if existing AppButton was not enough or complete to Answer Developing needs
/// it can be extended and developed by another widget or any other way of implementation

enum ButtonType {
  general,
  icon,
  filled,
  outlined,
}

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
  });

  factory AppButton.general({
    required Function() onTap,
    String? text,
    Widget? widget,
    AppIcons? icon,
    AppIcons? leading,
    bool? disabled,
    bool? loading,
  }) =>
      AppButton._(
        buttonType: ButtonType.general,
        onTap: onTap,
        text: text,
        icon: icon,
        leading: leading,
        disabled: disabled,
        loading: loading,
        child: widget,
      );

  factory AppButton.filled({
    required String text,
    required Function() onTap,
    AppIcons? icon,
    AppIcons? leading,
    bool? disabled,
    bool? loading,
  }) =>
      AppButton._(
        buttonType: ButtonType.filled,
        onTap: onTap,
        text: text,
        icon: icon,
        leading: leading,
        disabled: disabled,
        loading: loading,
      );

  factory AppButton.outlined({
    required String text,
    required Function() onTap,
    AppIcons? icon,
    AppIcons? leading,
    bool? disabled,
    bool? loading,
  }) =>
      AppButton._(
        buttonType: ButtonType.outlined,
        onTap: onTap,
        text: text,
        icon: icon,
        leading: leading,
        disabled: disabled,
        loading: loading,
      );

  factory AppButton.icon({
    required AppIcons icon,
    required Function() onTap,
    String? text,
  }) =>
      AppButton._(
        buttonType: ButtonType.icon,
        onTap: onTap,
        icon: icon,
        text: text,
      );
}
