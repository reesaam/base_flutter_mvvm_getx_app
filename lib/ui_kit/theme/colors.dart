import 'color_palette.dart';

export '../../core/extensions/theme_extensions/extension_theme.dart';

enum AppColors {
  background(AppColorPalette.primary),
  primary(AppColorPalette.primary),
  onPrimary(AppColorPalette.onPrimary),
  secondary(AppColorPalette.secondary),
  onSecondary(AppColorPalette.onSecondary),
  tertiary(AppColorPalette.tertiary),
  canvas(AppColorPalette.primary),
  appBarBackground(AppColorPalette.primary),
  appBarForeground(AppColorPalette.background),
  bottomNavigationBarBackground(AppColorPalette.primary),
  bottomNavigationBarForeground(AppColorPalette.background),
  error(AppColorPalette.error),
  buttonColor(AppColorPalette.secondary),
  buttonDisabled(AppColorPalette.onSecondary),
  transparent(AppColorPalette.transparent);

  final AppColorPalette colorPalette;
  const AppColors(this.colorPalette);
}