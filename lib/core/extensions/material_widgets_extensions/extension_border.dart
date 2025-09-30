import 'package:flutter/material.dart';

extension ExtensionBorderCopyWith on Border {
  Border copyWith({
    BorderSide? top,
    BorderSide? bottom,
    BorderSide? right,
    BorderSide? left,
  }) =>
      Border(
        top: top ?? BorderSide.none,
        bottom: bottom ?? BorderSide.none,
        right: right ?? BorderSide.none,
        left: left ?? BorderSide.none,
      );
}

extension ExtensionBorderDetails on Border {
  Border withWidth(double width) => copyWith(
        top: top.copyWith(width: width),
        bottom: bottom.copyWith(width: width),
        right: right.copyWith(width: width),
        left: left.copyWith(width: width),
      );
}
