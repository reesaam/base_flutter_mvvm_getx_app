import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

class AppSnackBar {
  AppSnackBar.show({
    String? message,
    String? title,
    Widget? widget,
    AppIcons? icon,
    Function()? leadingAction,
    AppIcons? leadingIcon,
    String? leadingText,
    String? buttonText,
    Function()? buttonAction,
    Color? backgroundColor,
    Color? textColor,
    bool? withProgressIndicator,
  }) {
    _showSnackBar(
      message: message,
      title: title,
      widget: widget,
      icon: icon,
      leadingAction: leadingAction,
      leadingIcon: leadingIcon,
      leadingText: leadingText,
      buttonText: buttonText,
      buttonAction: buttonAction,
      backgroundColor: backgroundColor,
      textColor: textColor,
      showProgressIndicator: withProgressIndicator,
    );
  }

  AppSnackBar.showError({
    String? message,
    String? title,
    Widget? widget,
    AppIcons? icon,
    Function()? leadingAction,
    AppIcons? leadingIcon,
    String? leadingText,
    String? buttonText,
    Function()? buttonAction,
  }) {
    _showSnackBar(
      message: message,
      title: title,
      widget: widget,
      icon: icon,
      leadingAction: leadingAction,
      leadingIcon: leadingIcon,
      leadingText: leadingText,
      buttonText: buttonText,
      buttonAction: buttonAction,
      backgroundColor: Get.theme.colorScheme.error,
    );
  }

  AppSnackBar.showWarning({
    String? message,
    String? title,
    Widget? widget,
    AppIcons? icon,
    Function()? leadingAction,
    AppIcons? leadingIcon,
    String? leadingText,
    String? buttonText,
    Function()? buttonAction,
  }) {
    _showSnackBar(
      message: message,
      title: title,
      widget: widget,
      icon: icon,
      leadingAction: leadingAction,
      leadingIcon: leadingIcon,
      leadingText: leadingText,
      buttonText: buttonText,
      buttonAction: buttonAction,
      backgroundColor: Get.theme.hintColor,
    );
  }
}

_showSnackBar({
  String? message,
  String? title,
  Widget? widget,
  Function(GetSnackBar)? onTap,
  AppIcons? icon,
  Function()? leadingAction,
  AppIcons? leadingIcon,
  String? leadingText,
  String? buttonText,
  Function()? buttonAction,
  Color? backgroundColor,
  Color? textColor,
  Color? iconColor,
  bool? isDismissible,
  CrossAxisAlignment? crossAxisAlignment,
  EdgeInsets? padding,
  EdgeInsets? margin,
  Duration? duration,
  bool? showProgressIndicator,
  AnimationController? progressIndicatorController,
}) =>
    GetSnackBar(
      //Elements
      titleText: title == null ? AppBox.shrink() : Text(title).withColor(textColor ?? Get.theme.canvasColor),
      messageText: widget ??
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (message != null) Text(message).withColor(textColor ?? Get.theme.canvasColor),
                if (buttonText != null)
                  Column(children: [
                    AppSpaces.h20,
                    AppButton.general(text: buttonText, onTap: buttonAction ?? nullFunction),
                  ]),
              ]),
      onTap: (snack) => onTap == null ? null : onTap(snack),
      mainButton: leadingIcon == null
          ? null
          : leadingText == null
              ? AppButton.icon(
                  icon: leadingIcon,
                  onTap: leadingAction ?? nullFunction,
                )
              : _buttonWidget(leadingAction ?? nullFunction, leadingText),

      //Specifications
      padding: padding ?? AppPaddings.snackBar,
      margin: margin ?? AppPaddings.snackBar,
      snackPosition: AppDefaults.snackBarPosition,
      snackStyle: SnackStyle.FLOATING,
      animationDuration: AppDefaults.snackBarAnimationDuration,
      duration: duration ?? AppDefaults.snackBarDuration,
      isDismissible: isDismissible ?? true,
      backgroundColor: backgroundColor ?? Get.theme.snackBarTheme.backgroundColor ?? Get.theme.colorScheme.tertiary,
      borderRadius: AppElements.defaultRadius,
      icon: icon?.widget.withColor(iconColor ?? textColor ?? Get.theme.canvasColor),
      shouldIconPulse: false,
      showProgressIndicator: showProgressIndicator ?? false,
      progressIndicatorBackgroundColor: showProgressIndicator == true ? backgroundColor ?? Get.theme.canvasColor : null,
      progressIndicatorController: progressIndicatorController,
    ).show();

Widget _buttonWidget(Function() buttonFunction, String buttonText) =>
    AppButton.general(text: buttonText, onTap: buttonFunction);
