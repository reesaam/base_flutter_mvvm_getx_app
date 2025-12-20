import 'color_palette.dart';

export '../../core/extensions/theme_extensions/extension_theme.dart';

enum AppColors {
  canvas(AppColorPalette.background),
  background(AppColorPalette.background),
  primary(AppColorPalette.primary),
  onPrimary(AppColorPalette.onPrimary),
  secondary(AppColorPalette.secondary),
  onSecondary(AppColorPalette.onSecondary),
  tertiary(AppColorPalette.tertiary),
  disabled(AppColorPalette.disabled),
  appBarBackground(AppColorPalette.background),
  appBarForeground(AppColorPalette.primary),
  bottomNavigationBarBackground(AppColorPalette.background),
  bottomNavigationBarForeground(AppColorPalette.primary),
  error(AppColorPalette.error),
  button(AppColorPalette.primary),
  buttonText(AppColorPalette.background),
  buttonBorder(AppColorPalette.background),
  buttonDisabled(AppColorPalette.disabled),
  buttonDisabledText(AppColorPalette.onDisabled),
  buttonDisabledBorder(AppColorPalette.onPrimary),
  transparent(AppColorPalette.transparent);

  final AppColorPalette colorPalette;
  const AppColors(this.colorPalette);
}