import 'package:flutter/material.dart';

import '../../core/core_resources/defaults.dart';

class AppProgressIndicator {
  static Widget circular({
    Color? color,
    double? width,
    double? strokeWidth,
  }) =>
      SizedBox(
          width: width,
          height: width,
          child: _AppProgressIndicatorCircular(
            indicatorColor: color,
            width: strokeWidth,
          ));

  static Widget linear({
    Color? color,
    Color? backgroundColor,
    double? width,
  }) =>
      SizedBox(
          width: width,
          child: _AppProgressIndicatorLinear(
            indicatorColor: color,
            indicatorBackgroundColor: backgroundColor,
          ));
}

class _AppProgressIndicatorCircular extends CircularProgressIndicator {
  const _AppProgressIndicatorCircular({this.indicatorColor, this.width});

  final Color? indicatorColor;
  final double? width;

  @override
  Color? get color => indicatorColor;

  @override
  double get strokeWidth => width ?? defaultCircularProgressBarWidth;
}

class _AppProgressIndicatorLinear extends LinearProgressIndicator {
  const _AppProgressIndicatorLinear({this.indicatorColor, this.indicatorBackgroundColor});

  final Color? indicatorColor;
  final Color? indicatorBackgroundColor;

  @override
  Color? get color => indicatorColor;

  @override
  Color? get backgroundColor => indicatorBackgroundColor;
}
