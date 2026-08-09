import '../../barrels/core_barrel.dart';

extension BuildContextData on BuildContext {
  Brightness get brightness => theme.brightness;
}
