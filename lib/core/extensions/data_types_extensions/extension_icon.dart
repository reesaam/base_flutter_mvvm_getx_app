import 'package:flutter/material.dart';

import '../../../ui_kit/theme/themes.dart';

extension ExtensionIconColor on Icon {
  Icon get withPrimaryColor => withColor(AppThemes.to.theme.primaryColor);
  Icon get withSecondaryColor => this;
  Icon get withTertiaryColor => this;
  Icon get withAppAppBackgroundColor => withColor(AppThemes.to.theme.canvasColor);
}

extension ExtensionIconSize on Icon {
  Icon withSize(double size) => Icon(icon, size: size, color: color);
  Icon withColor(Color color) => Icon(icon, size: size, color: color);
}
