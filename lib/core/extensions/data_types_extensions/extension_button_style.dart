import '../../../barrels/core_barrel.dart';

extension ButtonStyleColorsExtension on ButtonStyle {
  ButtonStyle? get invertColors => copyWith(
        backgroundColor: foregroundColor,
        foregroundColor: backgroundColor,
      );
}

extension ExtensionButtonCopyWith on ButtonStyle? {
  ButtonStyle? copyWith(
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<BorderSide?>? side,
    AlignmentGeometry? alignment,
    Duration? animationDuration,
    WidgetStateProperty<double?>? elevation,
    bool? enableFeedback,
    WidgetStateProperty<Size?>? fixedSize,
    WidgetStateProperty<Color?>? foregroundColor,
    WidgetStateProperty<Color?>? iconColor,
    WidgetStateProperty<double?>? iconSize,
    WidgetStateProperty<Size?>? maximumSize,
    WidgetStateProperty<Size?>? minimumSize,
    WidgetStateProperty<MouseCursor?>? mouseCursor,
    WidgetStateProperty<Color?>? overlayColor,
    WidgetStateProperty<EdgeInsetsGeometry?>? padding,
    WidgetStateProperty<Color?>? shadowColor,
    WidgetStateProperty<OutlinedBorder?>? shape,
    InteractiveInkFeatureFactory? splashFactory,
    WidgetStateProperty<Color?>? surfaceTintColor,
    MaterialTapTargetSize? tapTargetSize,
    WidgetStateProperty<TextStyle?>? textStyle,
    VisualDensity? visualDensity,
  ) =>
      ButtonStyle(
        backgroundColor: backgroundColor,
        side: side,
        alignment: alignment,
        animationDuration: animationDuration,
        elevation: elevation,
        enableFeedback: enableFeedback,
        fixedSize: fixedSize,
        foregroundColor: foregroundColor,
        iconColor: iconColor,
        iconSize: iconSize,
        maximumSize: maximumSize,
        minimumSize: minimumSize,
        mouseCursor: mouseCursor,
        overlayColor: overlayColor,
        padding: padding,
        shadowColor: shadowColor,
        shape: shape,
        splashFactory: splashFactory,
        surfaceTintColor: surfaceTintColor,
        tapTargetSize: tapTargetSize,
        textStyle: textStyle,
        visualDensity: visualDensity,
      );
}
