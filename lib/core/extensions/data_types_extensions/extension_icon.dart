import '../../../boiler_plates/boiler_plate_ui_kit.dart';
export '../../../boiler_plates/boiler_plate_ui_kit.dart';

extension ExtensionIconColor on Icon {
  Icon get withPrimaryColor => withColor(AppColors.primary.color);
  Icon get withSecondaryColor => withColor(AppColors.secondary.color);
  Icon get withTertiaryColor => withColor(AppColors.tertiary.color);
  Icon get withAppAppBackgroundColor => withColor(AppColors.background.color);
}

extension ExtensionIconSize on Icon {
  Icon withSize(double size) => Icon(icon, size: size, color: color);
  Icon withColor(Color color) => Icon(icon, size: size, color: color);
}
