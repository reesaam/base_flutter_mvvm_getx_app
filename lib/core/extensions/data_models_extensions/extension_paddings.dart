import '../../../barrels/ui_kit_barrel.dart';

extension ExtensionAppPaddingsCopyWith on EdgeInsets {
  AppPaddings copyWithSymmetric({
    double? horizontal,
    double? vertical,
  }) =>
      AppPaddings.symmetric(
        horizontal: horizontal ?? this.horizontal,
        vertical: vertical ?? this.vertical,
      );
}
