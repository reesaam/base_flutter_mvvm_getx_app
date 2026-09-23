import '../../barrels/ui_kit_barrel.dart';

extension BuildContextData on BuildContext {
  Brightness get brightness => theme.brightness;
}
