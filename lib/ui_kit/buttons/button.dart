import 'button_constructor.dart';
import 'button_type_enum.dart';

/// Abstraction for [AppButton] to Determine what functions Buttons have without checking the main file.
/// [AppButton] is the Main Widget which creates a general complete Widget of a Buttons with all the parameters

class AppButton extends AppButtonConstructor {
  const AppButton.general({
    super.key,
    required super.onTap,
    super.child,
    super.text,
    super.backgroundColor,
    super.borderColor,
    super.icon,
    super.leading,
    super.disabled,
    super.loading,
    super.size,
    super.textColor,
    super.iconColor,
    super.padding,
    super.margin,
    super.stateController,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
  }) : super(buttonType: ButtonType.general);

  const AppButton.filled({
    super.key,
    required super.onTap,
    super.child,
    super.text,
    super.backgroundColor,
    super.borderColor,
    super.icon,
    super.leading,
    super.disabled,
    super.loading,
    super.size,
    super.textColor,
    super.iconColor,
    super.padding,
    super.margin,
    super.stateController,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
  }) : super(buttonType: ButtonType.filled);

  const AppButton.outlined({
    super.key,
    required super.onTap,
    super.child,
    super.text,
    super.borderColor,
    super.icon,
    super.leading,
    super.disabled,
    super.loading,
    super.size,
    super.textColor,
    super.iconColor,
    super.padding,
    super.margin,
    super.stateController,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
  }) : super(buttonType: ButtonType.outlined);

  const AppButton.icon({
    super.key,
    required super.icon,
    required super.onTap,
    String? text,
    super.backgroundColor,
    super.iconColor,
    super.borderColor,
    super.size,
    super.loading,
    super.textColor,
    super.padding,
    super.margin,
    super.stateController,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
  }) : super(buttonType: ButtonType.icon);
}
