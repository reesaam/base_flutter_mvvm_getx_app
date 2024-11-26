import 'package:flutter/material.dart';

import '../theme/themes.dart';

class AppTextStyles extends TextStyle {
  final TextStyle? style;
  const AppTextStyles({this.style});

  ///Card
  factory AppTextStyles.cardTitle() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///Text Fields
  factory AppTextStyles.textFieldText() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
  factory AppTextStyles.textFieldLabel() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
  factory AppTextStyles.textFieldHint() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
  factory AppTextStyles.textError() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///Popup Menu
  factory AppTextStyles.popupMenuItem() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
  factory AppTextStyles.popupMenuItemSecondary() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///AppBar
  factory AppTextStyles.appBarTitle() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///ModalBottomSheet
  factory AppTextStyles.modalTitle() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///Dialogs
  factory AppTextStyles.dialogAlertTitle() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
  factory AppTextStyles.dialogAlertText() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///SnackBar
  factory AppTextStyles.snackBarMessage() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
  factory AppTextStyles.snackBarTitle() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///TextField
  factory AppTextStyles.textFieldCounter() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
  factory AppTextStyles.textFieldCounterError() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///SplashScreen
  factory AppTextStyles.splashScreenAppName() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);

  ///Settings
  factory AppTextStyles.settingsSectionTitle() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
  factory AppTextStyles.settingsSectionItem() => AppTextStyles(style: AppThemes.to.textTheme.displayLarge);
}
