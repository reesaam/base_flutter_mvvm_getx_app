import '../../../ui_kit/ui_kit_barrel.dart';
export '../../../ui_kit/ui_kit_barrel.dart';

import 'extension_color_palette.dart';

extension CreateColor on AppColors {
  Color get color => colorPalette.color;
  Color get lightColor => colorPalette.lightColor;
  Color get darkColor => colorPalette.darkColor;
  LinearGradient get lightGradient => colorPalette.lightGradient;
  LinearGradient get darkGradient => colorPalette.darkGradient;
}