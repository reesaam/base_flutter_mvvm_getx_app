import '../../barrels/ui_kit_barrel.dart';

class AppTextStyles extends TextStyle {
  final TextStyle? style;
  const AppTextStyles({this.style});

  ///Card
  factory AppTextStyles.cardTitle() => AppTextStyles(style: Get.textTheme.displayLarge);

  ///Text Fields
  factory AppTextStyles.textFieldText({AppColors? color}) => AppTextStyles(style: Get.textTheme.displayLarge?.copyWith(color: color?.color ?? AppColors.primary.color));
  factory AppTextStyles.textFieldLabel({AppColors? color}) => AppTextStyles(style: Get.textTheme.displayLarge?.copyWith(color: color?.color ?? AppColors.primary.color));
  factory AppTextStyles.textFieldHint({AppColors? color}) => AppTextStyles(style: Get.textTheme.displayLarge?.copyWith(color: color?.color ?? AppColors.primary.color));
  factory AppTextStyles.textError({AppColors? color}) => AppTextStyles(style: Get.textTheme.displayLarge?.copyWith(color: color?.color ?? AppColors.error.color));

  ///Popup Menu
  factory AppTextStyles.popupMenuItem() => AppTextStyles(style: Get.textTheme.displayLarge);
  factory AppTextStyles.popupMenuItemSecondary() => AppTextStyles(style: Get.textTheme.displayLarge);

  ///AppBar
  factory AppTextStyles.appBarTitle() => AppTextStyles(style: Get.textTheme.displayLarge);

  ///ModalBottomSheet
  factory AppTextStyles.modalTitle() => AppTextStyles(style: Get.textTheme.displayLarge);

  ///Dialogs
  factory AppTextStyles.dialogAlertTitle() => AppTextStyles(style: Get.textTheme.displayLarge);
  factory AppTextStyles.dialogAlertText() => AppTextStyles(style: Get.textTheme.displayLarge);

  ///SnackBar
  factory AppTextStyles.snackBarMessage() => AppTextStyles(style: Get.textTheme.displayLarge);
  factory AppTextStyles.snackBarTitle() => AppTextStyles(style: Get.textTheme.displayLarge);

  ///TextField
  factory AppTextStyles.textFieldCounter() => AppTextStyles(style: Get.textTheme.displayLarge);
  factory AppTextStyles.textFieldCounterError() => AppTextStyles(style: Get.textTheme.displayLarge);

  ///SplashScreen
  factory AppTextStyles.splashScreenAppName() => AppTextStyles(style: Get.textTheme.displayLarge);

  ///Settings
  factory AppTextStyles.settingsSectionTitle() => AppTextStyles(style: Get.textTheme.displayLarge);
  factory AppTextStyles.settingsSectionItem() => AppTextStyles(style: Get.textTheme.displayLarge);
}
