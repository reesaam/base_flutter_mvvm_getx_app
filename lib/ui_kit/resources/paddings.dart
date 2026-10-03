import '../../barrels/ui_kit_barrel.dart';

class AppPaddings extends EdgeInsets {
  const AppPaddings.all(double? value) : super.all(value ?? 0);
  const AppPaddings.only({double? left, double? top, double? right, double? bottom})
    : super.only(left: left ?? 0, top: top ?? 0, right: right ?? 0, bottom: bottom ?? 0);
  const AppPaddings.fromLTRB(double? left, double? top, double? right, double? bottom) : super.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);
  const AppPaddings.symmetric({double? horizontal, double? vertical}) : super.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0);

  ///General
  static AppPaddings get pages => const AppPaddings.all(10);
  static AppPaddings get zero => const AppPaddings.all(0);

  ///Elements
  static AppPaddings get textFieldContent => const AppPaddings.symmetric(horizontal: 20, vertical: 10);
  static AppPaddings get progress => const AppPaddings.symmetric(horizontal: 5, vertical: 5);

  ///AppBar
  static AppPaddings get appBarActions => const AppPaddings.only(right: 20);

  ///Drawer
  static AppPaddings get drawerHeader => const AppPaddings.fromLTRB(10, 20, 20, 20);
  static AppPaddings get drawerFooter => const AppPaddings.fromLTRB(20, 10, 0, 20);

  ///Modals and Dialogs
  static AppPaddings get generalBottomModal => AppPaddings.fromLTRB(20, 10, 20, Get.context!.mediaQuery.viewInsets.bottom);
  static AppPaddings get generalAlertDialog => const AppPaddings.all(10);
  static AppPaddings get modalItems => const AppPaddings.symmetric(vertical: 15);

  ///SnackBar
  static AppPaddings get snackBar => const AppPaddings.symmetric(horizontal: 20, vertical: 20);

  ///Buttons
  static AppPaddings get buttonDefaultPadding => const AppPaddings.symmetric(horizontal: 10, vertical: 10);
  static AppPaddings get buttonXSmall => const AppPaddings.symmetric(horizontal: 100, vertical: 10);
  static AppPaddings get buttonSmall => const AppPaddings.symmetric(horizontal: 80, vertical: 10);
  static AppPaddings get buttonMedium => const AppPaddings.symmetric(horizontal: 60, vertical: 10);
  static AppPaddings get buttonLarge => const AppPaddings.symmetric(horizontal: 40, vertical: 10);
  static AppPaddings get buttonXLarge => const AppPaddings.symmetric(horizontal: 20, vertical: 10);

  ///SplashScreen
  static AppPaddings get splashScreenProgressIndicator => const AppPaddings.only(top: 200);

  ///Homepage
  static AppPaddings get homepageTopBar => const AppPaddings.symmetric(horizontal: 30, vertical: 20);
  static AppPaddings get homepageDateTimeCard => const AppPaddings.symmetric(vertical: 20);
  static AppPaddings get homepageSummeryCard => const AppPaddings.all(20);
  static AppPaddings get homepageSummeryCardData => const AppPaddings.fromLTRB(20, 0, 50, 0);
  static AppPaddings get homepageDateTimeCardSettingIcon => const AppPaddings.fromLTRB(0, 10, 10, 0);
  static AppPaddings get homepageButtons => const AppPaddings.fromLTRB(50, 40, 50, 0);

  ///Settings
  static AppPaddings get settingsSection => const AppPaddings.fromLTRB(20, 20, 20, 10);
  static AppPaddings get settingsItem => const AppPaddings.symmetric(horizontal: 15, vertical: 10);

  ///Update
  static AppPaddings get updateVersions => const AppPaddings.symmetric(horizontal: 30, vertical: 20);
  static AppPaddings get updateButtons => const AppPaddings.symmetric(horizontal: 50);
}
