import '../../barrels/ui_kit_barrel.dart';

class AppDefaults {
  /// Font
  static double get fontSize => 14;

  /// TimeOuts
  static Duration get timeOutGeneral => const Duration(seconds: 20);
  static Duration get timeOutConnection => const Duration(seconds: 10);
  static Duration get timeOutDeepLink => const Duration(seconds: 10);
  static Transition get transition => Transition.fadeIn;
  static Duration get transitionDuration => const Duration(milliseconds: 1);
  static int get pageTransitionDelay => 5;

  /// ProgressBar
  static double get circularProgressBarWidth => 5;

  /// SnackBar
  static Duration get snackBarAnimationDuration => const Duration(seconds: 2);
  static Duration get snackBarDuration => const Duration(seconds: 3);
  static SnackPosition get snackBarPosition => SnackPosition.TOP;

  /// Borders
  static double get borderWidth => 2;

  /// Widgets
  static double get buttonsGeneralHeight => 50;
  static double get iconButtonIconSize => 22;
  static double get iconButtonSize => 26;
  static double get popUpMenuButton => 20;
  static double get appbarIconButtonHeight => 60;
  static double get columnSpacing => 20;
  static Size get switchHeight => const Size.fromHeight(20);
  static double get drawerHeaderIconWidth => 50;
  static EdgeInsets get buttonPadding => const EdgeInsets.symmetric(horizontal: 5, vertical: 5);
}
