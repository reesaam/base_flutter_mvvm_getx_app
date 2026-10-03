import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/extensions_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppSnackBarWidget<T> extends GetSnackBar {
  const AppSnackBarWidget({
    super.key,
    this.titleInput,
    this.backgroundColorInput,
    this.borderColorInput,
    this.borderRadiusInput,
    this.onTapInput,
    this.widgetInput,
    this.titleColorInput,
    this.messageInput,
    this.messageColorInput,
    this.iconInput,
    this.iconColorInput,
    this.leadingIconInput,
    this.leadingIconColorInput,
    this.leadingTextInput,
    this.leadingActionInput,
    this.leadingTextColorInput,
    this.buttonActionInput,
    this.buttonTextInput,
    this.buttonColorInput,
    this.buttonTextColorInput,
    this.crossAxisAlignment,
    this.isDismissibleInput,
    this.iconPulseInput,
    this.paddingInput,
    this.marginInput,
    this.durationInput,
    this.showProgressIndicatorInput,
    this.progressIndicatorBackgroundColorInput,
    this.progressIndicatorControllerInput,
  });

  final AppColors? backgroundColorInput;
  final AppColors? borderColorInput;
  final AppElementRadius? borderRadiusInput;
  final Function()? onTapInput;
  final Widget? widgetInput;
  final String? titleInput;
  final AppColors? titleColorInput;
  final String? messageInput;
  final AppColors? messageColorInput;
  final AppIcons? iconInput;
  final AppColors? iconColorInput;
  final AppIcons? leadingIconInput;
  final AppColors? leadingIconColorInput;
  final String? leadingTextInput;
  final Function()? leadingActionInput;
  final AppColors? leadingTextColorInput;
  final Function()? buttonActionInput;
  final String? buttonTextInput;
  final AppColors? buttonColorInput;
  final AppColors? buttonTextColorInput;

  final CrossAxisAlignment? crossAxisAlignment;
  final bool? isDismissibleInput;
  final bool? iconPulseInput;
  final EdgeInsets? paddingInput;
  final EdgeInsets? marginInput;
  final Duration? durationInput;
  final bool? showProgressIndicatorInput;
  final AppColors? progressIndicatorBackgroundColorInput;
  final AnimationController? progressIndicatorControllerInput;

  @override
  Widget? get messageText =>
      widgetInput ??
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (messageInput.isNotNullOrEmpty) Text(messageInput ?? '').copyWith(textColor: messageColorInput),
          if (buttonTextInput.isNotNullOrEmpty)
            Column(
              children: [
                AppSpaces.h20,
                AppButton.general(text: buttonTextInput, onTap: buttonActionInput ?? nullFunction),
              ],
            ),
        ],
      );

  @override
  Widget? get titleText => titleInput.isNullOrEmpty ? null : Text(titleInput ?? '').copyWith(textColor: titleColorInput);

  @override
  Widget? get mainButton {
    Widget? widget;
    if (leadingIconInput != null) {
      AppButton.icon(icon: leadingIconInput, onTap: leadingActionInput ?? nullFunction);
    } else if (leadingTextInput != null) {
      widget = _buttonWidget(leadingActionInput ?? nullFunction, leadingTextInput ?? '');
    }
    return widget;
  }

  @override
  OnTap? get onTap => onTapInput == null ? nullFunction : onTapInput!();

  @override
  Widget? get icon => iconInput?.widget.copyWith(color: (iconColorInput ?? AppColors.primary).color);

  @override
  Color get backgroundColor => (backgroundColorInput ?? AppColors.background).color;

  @override
  Color? get borderColor => (borderColorInput ?? AppColors.primary).color;

  @override
  double get borderRadius => (borderRadiusInput ?? AppElements.snackbarRadius).radius;

  @override
  bool get showProgressIndicator => showProgressIndicatorInput ?? false;

  @override
  Color? get progressIndicatorBackgroundColor => (progressIndicatorBackgroundColorInput ?? AppColors.primary).color;

  @override
  AnimationController? get progressIndicatorController => progressIndicatorControllerInput;

  @override
  EdgeInsets get padding => paddingInput ?? AppPaddings.snackBar;

  @override
  EdgeInsets get margin => marginInput ?? AppPaddings.snackBar;

  @override
  SnackPosition get snackPosition => AppDefaults.snackBarPosition;

  @override
  SnackStyle get snackStyle => SnackStyle.FLOATING;

  @override
  Duration? get duration => durationInput ?? AppDefaults.snackBarDuration;

  @override
  Duration get animationDuration => AppDefaults.snackBarAnimationDuration;

  @override
  bool get isDismissible => isDismissibleInput ?? true;

  @override
  bool get shouldIconPulse => iconPulseInput ?? false;

  Widget _buttonWidget(Function() buttonFunction, String buttonText) => AppButton.general(text: buttonText, onTap: buttonFunction);
}
