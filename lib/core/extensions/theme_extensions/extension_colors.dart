import '../../../boiler_plates/boiler_plate_ui_kit.dart';
export '../../../boiler_plates/boiler_plate_ui_kit.dart';

import 'extension_color_palette.dart';

extension CreateColor on AppColors {
  Color get color => colorPalette.color;
  Color get lightColor => colorPalette.lightColor;
  Color get darkColor => colorPalette.darkColor;
  LinearGradient get lightGradient => colorPalette.lightGradient;
  LinearGradient get darkGradient => colorPalette.darkGradient;
}