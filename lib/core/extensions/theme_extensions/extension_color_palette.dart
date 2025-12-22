import '../../../boiler_plates/boiler_plate_ui_kit.dart';

import '../../../ui_kit/theme/color_palette.dart';
import '../../core_functions.dart';
import '../data_types_extensions/extension_string.dart';

Color _defaultColor = Colors.transparent;
LinearGradient _defaultGradient = LinearGradient(colors: [_defaultColor, _defaultColor]);

extension ColorPaletteExtension on AppColorPalette {
  String get getName => colorName ?? name.capitalizeFirst ?? '';
}

extension ColorExtensionForAppColorPalette on AppColorPalette {
  Color get lightColor => _createColorFromColorCode(lightColorCode) ?? _defaultColor;
  Color get darkColor => _createColorFromColorCode(darkColorCode) ?? _defaultColor;
  LinearGradient get lightGradient => _createGradientFromColorCode(gradientColorCodes: lightGradientCodes, singleColorCode: lightColorCode) ?? _defaultGradient;
  LinearGradient get darkGradient => _createGradientFromColorCode(gradientColorCodes: darkGradientCodes, singleColorCode: darkColorCode) ?? _defaultGradient;

  Color get color {
    Color color = _defaultColor;
    if (Get.context?.isLight ?? true) {
      Color? lightColor = _createColorFromColorCode(lightColorCode);
      if (lightColor == null && (lightGradientCodes?.isNotEmpty ?? false)) {
        lightColor = _createColorFromColorCode(lightGradientCodes!.first);
      }
      if (lightColor != null) color = lightColor;
    } else {
      Color? darkColor = _createColorFromColorCode(darkColorCode);
      if (darkColor == null && (darkGradientCodes?.isNotEmpty ?? false)) {
        darkColor = _createColorFromColorCode(darkGradientCodes!.first);
      }
      if (darkColor != null) color = darkColor;
    }
    appDebugPrint('ColorExtensionForAppColorPalette: $this');
    return color;
  }

  LinearGradient get gradient =>
      (Get.context?.isLight ?? false
          ? _createGradientFromColorCode(gradientColorCodes: lightGradientCodes, singleColorCode: lightColorCode)
          : _createGradientFromColorCode(gradientColorCodes: darkGradientCodes, singleColorCode: darkColorCode)) ??
          _defaultGradient;
}

Color? _createColorFromColorCode(String? colorCode) {
  if (colorCode.isNullOrEmpty) {
    return null;
  } else {
    String generatedColorCode = colorCode!.length > 6 ? '0x$colorCode' : '0xFF$colorCode';
    return Color(int.tryParse(generatedColorCode.toUpperCase()) ?? _defaultColor.value);
  }
}

LinearGradient? _createGradientFromColorCode({List<String>? gradientColorCodes, String? singleColorCode}) {
  List<Color> colors = List<Color>.empty(growable: true);
  if (gradientColorCodes?.isNotEmpty ?? false) {
    for (int i = 0; i < (gradientColorCodes?.length ?? 0); i++) {
      final cl = _createColorFromColorCode(gradientColorCodes?[i]);
      if (cl != null) colors.add(cl);
    }
  } else {
    Color singleColor = _createColorFromColorCode(singleColorCode) ?? _defaultColor;
    colors.addAll([singleColor, singleColor]);
  }
  return LinearGradient(colors: colors);
}