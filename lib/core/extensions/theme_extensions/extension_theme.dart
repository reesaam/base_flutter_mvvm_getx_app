import '../../../barrels/ui_kit_barrel.dart';

extension BuildContextExtensions on BuildContext {
  Brightness? get brightness => Get.context?.theme.brightness;
  TextTheme? get textTheme => Get.context?.theme.textTheme;
  bool get isLight => brightness?.isLight ?? false;
}

extension BrightnessExtensions on Brightness {
  bool get isLight => Get.context?.brightness == Brightness.light;
}

