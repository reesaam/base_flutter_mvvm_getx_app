import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/themes.dart';

class AppTextStyles extends TextStyle {
  final TextStyle? style;
  const AppTextStyles({this.style});

  ///Card
  factory AppTextStyles.cardTitle() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///Text Fields
  factory AppTextStyles.textFieldText() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
  factory AppTextStyles.textFieldLabel() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
  factory AppTextStyles.textFieldHint() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
  factory AppTextStyles.textError() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///Popup Menu
  factory AppTextStyles.popupMenuItem() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
  factory AppTextStyles.popupMenuItemSecondary() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///AppBar
  factory AppTextStyles.appBarTitle() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///ModalBottomSheet
  factory AppTextStyles.modalTitle() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///Dialogs
  factory AppTextStyles.dialogAlertTitle() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
  factory AppTextStyles.dialogAlertText() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///SnackBar
  factory AppTextStyles.snackBarMessage() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
  factory AppTextStyles.snackBarTitle() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///TextField
  factory AppTextStyles.textFieldCounter() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
  factory AppTextStyles.textFieldCounterError() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///SplashScreen
  factory AppTextStyles.splashScreenAppName() => AppTextStyles(style: Get.theme.textTheme.displayLarge);

  ///Settings
  factory AppTextStyles.settingsSectionTitle() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
  factory AppTextStyles.settingsSectionItem() => AppTextStyles(style: Get.theme.textTheme.displayLarge);
}
