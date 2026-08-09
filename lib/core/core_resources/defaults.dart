import '../../barrels/core_barrel.dart';

class AppDefaults {
  ///Font
  static double get fontSize => 14;

  ///TimeOuts
  static Duration get timeOutGeneral => const Duration(seconds: 20);
  static Duration get timeOutConnection => const Duration(seconds: 10);
  static Duration get timeOutDeepLink => const Duration(seconds: 10);
  static Transition get transition => Transition.fadeIn;
  static Duration get transitionDuration => const Duration(milliseconds: 1);
  static int get pageTransitionDelay => 5;

  ///ProgressBar
  static double get circularProgressBarWidth => 5;

  ///SnackBar
  static Duration get snackBarAnimationDuration => const Duration(seconds: 2);
  static Duration get snackBarDuration => const Duration(seconds: 3);
  static SnackPosition get snackBarPosition => SnackPosition.TOP;

  ///Borders
  static double get borderWidth => 2;

  ///Buttons
  static double get buttonHeight => 50;
  static EdgeInsets get buttonPadding => const EdgeInsets.symmetric(horizontal: 5, vertical: 5);
}
