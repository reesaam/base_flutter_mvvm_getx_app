import 'package:flutter/material.dart';

import '../../../ui_kit/resources/paddings.dart';

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
