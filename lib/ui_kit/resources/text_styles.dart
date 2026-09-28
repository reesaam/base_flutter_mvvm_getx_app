import '../../barrels/ui_kit_barrel.dart';

class AppTextStyles extends TextStyle {
  static TextStyle _defaultStyle({TextStyle? inputStyle}) => inputStyle ?? Get.textTheme.displayLarge ?? TextStyle();

  /// Other
  static TextStyle custom(TextStyle style) => style;

  ///Card
  static TextStyle cardTitle() => _defaultStyle();

  ///Text Fields
  static TextStyle textFieldText({AppColors? color}) => _defaultStyle().copyWith(color: color?.color ?? AppColors.textFieldText.color);
  static TextStyle textFieldLabel({AppColors? color}) => _defaultStyle(inputStyle: Get.textTheme.displayMedium).copyWith(color: color?.color ?? AppColors.textFieldLabel.color);
  static TextStyle textFieldHint({AppColors? color}) => _defaultStyle(inputStyle: Get.textTheme.displayMedium).copyWith(color: color?.color ?? AppColors.textFieldHint.color);
  static TextStyle textFieldHelper({AppColors? color}) => _defaultStyle(inputStyle: Get.textTheme.displayMedium).copyWith(color: color?.color ?? AppColors.textFieldHelper.color);
  static TextStyle textFieldError({AppColors? color}) => _defaultStyle().copyWith(color: color?.color ?? AppColors.error.color);

  ///Popup Menu
  static TextStyle popupMenuItem() => _defaultStyle();
  static TextStyle popupMenuItemSecondary() => _defaultStyle();

  ///AppBar
  static TextStyle appBarTitle() => _defaultStyle();

  ///ModalBottomSheet
  static TextStyle modalTitle() => _defaultStyle();

  ///Dialogs
  static TextStyle dialogAlertTitle() => _defaultStyle();
  static TextStyle dialogAlertText() => _defaultStyle();

  ///SnackBar
  static TextStyle snackBarMessage() => _defaultStyle();
  static TextStyle snackBarTitle() => _defaultStyle();

  ///TextField
  static TextStyle textFieldCounter() => _defaultStyle();
  static TextStyle textFieldCounterError() => _defaultStyle();

  ///SplashScreen
  static TextStyle splashScreenAppName() => _defaultStyle();

  static TextStyle settingsSectionTitle() => _defaultStyle();
  static TextStyle settingsSectionItem() => _defaultStyle();
}
