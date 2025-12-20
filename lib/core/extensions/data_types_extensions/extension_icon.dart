import '../../../ui_kit/theme/colors.dart';
import '../theme_extensions/extension_colors.dart';

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
