import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core_resources/fonts.dart';
import '../../core/core_resources/defaults.dart';

class AppThemesVariables {
  ///General Variables
  static String get appFont => AppFonts.defaultFont;
  static TextTheme get textTheme => Theme.of(Get.context!).textTheme;

  ///Color Modes
  static Color get transparent => _transparent;
  static Color get appBackground => _white;
  static Color get appBackgroundDark => _black;
  static Color get appPrimary => _persianGreen;
  static Color get appPrimaryDark => _white;
  static Color get appSecondary => _grey;
  static Color get appSecondaryDark => _white;
  static Color get appTertiary => _black;
  static Color get appTertiaryDark => _white;
  static Color get appDisabled => _grey.withOpacity(0.8);
  static Color get appDisabledDark => _grey.withOpacity(0.8);
  static Color get appOnDisabled => _grey.withOpacity(0.6);
  static Color get appOnDisabledDark => _grey.withOpacity(0.6);
  static Color get appError => _red;
  static Color get appErrorDark => _red;
  static Color get appWarning => _orange;
  static Color get appWarningDark => _orange;

  ///Colors
  static Color get _transparent => Colors.transparent;
  static Color get _white => Colors.white;
  static Color get _black => Colors.black.withOpacity(0.8);
  static Color get _grey => Colors.grey;
  static Color get _red => Colors.redAccent;
  static Color get _yellow => Colors.yellow;
  static Color get _orange => Colors.orangeAccent;

  ///Special Colors
  static Color get _coral => const Color(0xFFFE7D6A);
  static Color get _strawberry => const Color(0xFFFC4C4E);
  static Color get _persianOrange => const Color(0xFFFC4C4E);
  static Color get _persianRed => const Color(0xFFCC3333);
  static Color get _persianGreen => const Color(0xff009D88);

  ///Sizes
  static double get _textSizeDefault => appDefaultFontSize;
  static double get textSizeXSmall => _textSizeDefault - 4;
  static double get textSizeSmall => _textSizeDefault - 2;
  static double get textSizeNormal => _textSizeDefault;
  static double get textSizeLarge => _textSizeDefault + 3;
  static double get textSizeXLarge => _textSizeDefault + 5;
  static double get textSizeTitle => _textSizeDefault + 8;
  static double get textSizeTitleLarge => _textSizeDefault + 14;
  static double get textSizeTitleHuge => _textSizeDefault + 30;

  ///Color Scheme
  static ColorScheme get colorSchemeLight => ColorScheme(
        brightness: Brightness.light,
        primary: appPrimary,
        onPrimary: appPrimary,
        secondary: appSecondary,
        onSecondary: appTertiary,
        tertiary: appTertiary,
        onTertiary: appSecondary,
        error: appError,
        onError: appDisabled,
        background: appBackground,
        onBackground: appPrimary,
        surface: appSecondary,
        onSurface: appTertiary,
      );

  static ColorScheme get colorSchemeDark => ColorScheme(
        brightness: Brightness.dark,
        primary: appPrimaryDark,
        onPrimary: appPrimaryDark,
        secondary: appSecondaryDark,
        onSecondary: appTertiaryDark,
        tertiary: appTertiaryDark,
        onTertiary: appSecondaryDark,
        error: appErrorDark,
        onError: appDisabledDark,
        background: appBackgroundDark,
        onBackground: appPrimaryDark,
        surface: appSecondaryDark,
        onSurface: appTertiaryDark,
      );

  ///Color Scheme Seed
  static Color get colorSchemeSeedLight => appError;
  static Color get colorSchemeSeedDark => appSecondaryDark;
}
