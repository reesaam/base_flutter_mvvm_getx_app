import '../../../barrels/ui_kit_barrel.dart';

extension OnColorExtension on Color {
  Color get lowOpacity => withAlpha(400);
}