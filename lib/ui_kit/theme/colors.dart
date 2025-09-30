import 'color_palette.dart';

enum AppColors {
  background(AppColorPalette.primary),
  primary(AppColorPalette.primary),
  secondary(AppColorPalette.secondary),
  tertiary(AppColorPalette.tertiary),
  canvas(AppColorPalette.background),
  appBarBackground(AppColorPalette.background),
  appBarForeground(AppColorPalette.background),
  error(AppColorPalette.error),
  buttonColor(AppColorPalette.secondary),
  buttonDisabled(AppColorPalette.onSecondary),
  transparent(AppColorPalette.transparent);

  final AppColorPalette colorPalette;
  const AppColors(this.colorPalette);
}