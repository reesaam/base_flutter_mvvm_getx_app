import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPaddings extends EdgeInsets {
  const AppPaddings.all(double? value) : super.all(value ?? 0);
  const AppPaddings.only({double? left, double? top, double? right, double? bottom})
      : super.only(left: left ?? 0, top: top ?? 0, right: right ?? 0, bottom: bottom ?? 0);
  const AppPaddings.fromLTRB(double? left, double? top, double? right, double? bottom) : super.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);
  const AppPaddings.symmetric({double? horizontal, double? vertical}) : super.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0);

  ///General
  static EdgeInsets get pages => const EdgeInsets.all(10);
  static EdgeInsets get zero => const EdgeInsets.all(0);

  ///Elements
  static EdgeInsets get textFieldContent => const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets get progress => const EdgeInsets.symmetric(horizontal: 5, vertical: 5);

  ///AppBar
  static EdgeInsets get appBarActions => const EdgeInsets.only(right: 20);

  ///Drawer
  static EdgeInsets get drawerHeader => const EdgeInsets.fromLTRB(10, 20, 20, 20);
  static EdgeInsets get drawerFooter => const EdgeInsets.fromLTRB(20, 10, 0, 20);

  ///Modals and Dialogs
  static EdgeInsets get generalBottomModal => EdgeInsets.fromLTRB(20, 10, 20, Get.context!.mediaQuery.viewInsets.bottom);
  static EdgeInsets get generalAlertDialog => const EdgeInsets.all(10);
  static EdgeInsets get modalItems => const EdgeInsets.symmetric(vertical: 15);

  ///SnackBar
  static EdgeInsets get snackBar => const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

  ///Buttons
  static EdgeInsets get buttonXSmall => const EdgeInsets.symmetric(horizontal: 100, vertical: 10);
  static EdgeInsets get buttonSmall => const EdgeInsets.symmetric(horizontal: 80, vertical: 10);
  static EdgeInsets get buttonMedium => const EdgeInsets.symmetric(horizontal: 60, vertical: 10);
  static EdgeInsets get buttonLarge => const EdgeInsets.symmetric(horizontal: 40, vertical: 10);
  static EdgeInsets get buttonXLarge => const EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  ///SplashScreen
  static EdgeInsets get splashScreenProgressIndicator => const EdgeInsets.only(top: 200);

  ///Homepage
  static EdgeInsets get homepageTopBar => const EdgeInsets.symmetric(horizontal: 30, vertical: 20);
  static EdgeInsets get homepageDateTimeCard => const EdgeInsets.symmetric(vertical: 20);
  static EdgeInsets get homepageSummeryCard => const EdgeInsets.all(20);
  static EdgeInsets get homepageSummeryCardData => const EdgeInsets.fromLTRB(20, 0, 50, 0);
  static EdgeInsets get homepageDateTimeCardSettingIcon => const EdgeInsets.fromLTRB(0, 10, 10, 0);
  static EdgeInsets get homepageButtons => const EdgeInsets.fromLTRB(50, 40, 50, 0);

  ///Settings
  static EdgeInsets get settingsSection => const EdgeInsets.fromLTRB(0, 20, 0, 10);
  static EdgeInsets get settingsItem => const EdgeInsets.symmetric(horizontal: 15, vertical: 10);

  ///Update
  static EdgeInsets get updateVersions => const EdgeInsets.symmetric(horizontal: 30, vertical: 20);
  static EdgeInsets get updateButtons => const EdgeInsets.symmetric(horizontal: 50).copyWith(bottom: 50);
}
