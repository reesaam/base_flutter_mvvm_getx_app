import 'package:flutter/material.dart';

import '../../../ui_kit/theme/colors.dart';
import 'extension_theme.dart';

extension CreateColor on AppColors {
  Color get color => colorPalette.color;
}