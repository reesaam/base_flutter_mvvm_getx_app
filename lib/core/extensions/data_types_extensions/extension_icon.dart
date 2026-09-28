import '../../../barrels/ui_kit_barrel.dart';

extension ExtensionIconSize on Icon {
  Icon copyWith({double? size, Color? color, double? fill}) =>
      Icon(icon, color: color ?? this.color, size: size ?? this.size, fill: fill ?? this.fill);
}
