import '../../../ui_kit/ui_kit_barrel.dart';
export '../../../ui_kit/ui_kit_barrel.dart';

extension OnColorExtension on Color {
  Color get lowOpacity => withAlpha(400);
}