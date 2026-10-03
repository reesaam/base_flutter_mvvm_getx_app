import '../../../barrels/ui_kit_barrel.dart';

extension AppPaddingsExtensions on AppPaddings {
  AppPaddings copyWith({double? left, double? top, double? right, double? bottom}) =>
      AppPaddings.only(left: left ?? this.left, top: top ?? this.top, right: right ?? this.right, bottom: bottom ?? this.bottom);
}

extension EdgeInsetsExtensions on EdgeInsets {
  AppPaddings copyWith({double? left, double? top, double? right, double? bottom}) =>
      AppPaddings.only(left: left ?? this.left, top: top ?? this.top, right: right ?? this.right, bottom: bottom ?? this.bottom);
}
