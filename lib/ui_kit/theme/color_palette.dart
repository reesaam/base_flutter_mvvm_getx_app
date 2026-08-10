enum AppColorPalette {
  transparent(lightColorCode: '00000000'),
  background(lightColorCode: 'FFFFFF', darkColorCode: '000000'),
  primary(lightColorCode: _persianGreen, darkColorCode: _persianGreen),
  onPrimary(lightColorCode: '000000', darkColorCode: 'FFFFFF'),
  secondary(lightColorCode: _coral, darkColorCode: _coral),
  onSecondary(lightColorCode: 'FFFFFF', darkColorCode: '000000'),
  tertiary(),
  onTertiary(),
  disabled(),
  onDisabled(),
  error(),
  onError(),
  warning(),
  onWarning();

  final String? colorName;
  final String? lightColorCode;
  final String? darkColorCode;
  final List<String>? lightGradientCodes;
  final List<String>? darkGradientCodes;
  final double? opacity;
  const AppColorPalette({this.colorName, this.lightColorCode, this.darkColorCode, this.lightGradientCodes, this.darkGradientCodes, this.opacity});
}

const String _coral = 'FE7D6A';
const String _strawberry = 'FC4C4E';
const String _persianOrange = 'FC4C4E';
const String _persianRed = 'CC3333';
const String _persianGreen = '009D88';
