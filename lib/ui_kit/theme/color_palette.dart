import '../../barrels/core_barrel.dart';

enum AppColorPalette {
  transparent(lightColorFromColors: Colors.transparent),
  canvas(lightColorFromColors: Colors.white70, darkColorFromColors: Colors.black54),
  background(lightColorFromColors: Colors.white70, darkColorFromColors: Colors.black54),
  primary(lightColorCode: _persianGreen, darkColorCode: _persianGreen),
  onPrimary(lightColorFromColors: Colors.white70, darkColorFromColors: Colors.black54),
  secondary(lightColorCode: _coral, darkColorCode: _coral),
  onSecondary(lightColorFromColors: Colors.white70, darkColorFromColors: Colors.black54),
  tertiary(lightColorFromColors: Colors.green, darkColorFromColors: Colors.green),
  onTertiary(lightColorFromColors: Colors.black54, darkColorFromColors: Colors.black54),
  disabled(lightColorFromColors: Colors.grey, darkColorFromColors: Colors.grey),
  onDisabled(lightColorFromColors: Colors.black54, darkColorFromColors: Colors.black54),
  error(lightColorFromColors: Colors.redAccent, darkColorFromColors: Colors.red),
  onError(lightColorFromColors: Colors.black54, darkColorFromColors: Colors.black54),
  warning(lightColorFromColors: Colors.yellowAccent, darkColorFromColors: Colors.yellow),
  onWarning(lightColorFromColors: Colors.black54, darkColorFromColors: Colors.black54);

  final String? colorName;
  final String? lightColorCode;
  final String? darkColorCode;
  final Color? lightColorFromColors;
  final Color? darkColorFromColors;
  final List<String>? lightGradientCodes;
  final List<String>? darkGradientCodes;
  final double? opacity;

  const AppColorPalette({
    this.colorName,
    this.lightColorCode,
    this.darkColorCode,
    this.lightGradientCodes,
    this.darkGradientCodes,
    this.opacity,
    this.lightColorFromColors,
    this.darkColorFromColors,
  });
}

const String _coral = 'FE7D6A';
const String _strawberry = 'FC4C4E';
const String _persianOrange = 'FC4C4E';
const String _persianRed = 'CC3333';
const String _persianGreen = '009D88';
