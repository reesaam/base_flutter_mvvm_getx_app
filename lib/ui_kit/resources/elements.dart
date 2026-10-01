import '../../barrels/ui_kit_barrel.dart';

class AppElements {
  static AppElementRadius get getDefaultRadius => AppElementRadius.low;

  /// Radius
  static Radius circularRadius({AppElementRadius? radius}) => Radius.circular((radius ?? getDefaultRadius).radius);
  static BorderRadius borderRadiusCircular({AppElementRadius? radius}) => BorderRadius.all(circularRadius(radius: radius));
  static BorderRadius borderRadiusCircularTop({AppElementRadius? radius}) => BorderRadius.only(topLeft: circularRadius(radius: radius), topRight: circularRadius(radius: radius));
  static BorderRadius borderRadiusCircularBottom({AppElementRadius? radius}) => BorderRadius.only(bottomLeft: circularRadius(radius: radius), bottomRight: circularRadius(radius: radius));

  /// BorderSide
  static BorderSide borderSide({AppColors? color, BorderStyle? borderStyle, double? width}) => BorderSide(color: (color ?? AppColors.primary).color, style: borderStyle ?? BorderStyle.solid, width: width ?? 1);
  static BorderSide borderSideError({BorderStyle? borderStyle, double? width}) => borderSide(color: AppColors.error, borderStyle: borderStyle, width: width);
  static BorderSide borderSideTransparent({BorderStyle? borderStyle, double? width}) => borderSide(color: AppColors.transparent, borderStyle: borderStyle, width: width);
  static BorderSide borderSideFocused({BorderStyle? borderStyle, double? width}) => borderSide(color: AppColors.primary, borderStyle: borderStyle, width: width);
  static BorderSide borderSideDisabled({BorderStyle? borderStyle, double? width}) => borderSide(color: AppColors.disabled, borderStyle: borderStyle, width: width);

  /// [Border] BoxBorder
  static BoxBorder boxBorder({AppColors? color, BorderStyle? style, double? width}) => BoxBorder.all(color: (color ?? AppColors.primary).color, style: style ?? BorderStyle.solid, width: width ?? 1);

  static BoxBorder boxBorderError({AppColors? color, BorderStyle? style, double? width}) => BoxBorder.all(color: (color ?? AppColors.error).color, style: style ?? BorderStyle.solid, width: width ?? 1);
  static BoxBorder boxBorderTransparent({BorderStyle? style, double? width}) => BoxBorder.all(color: AppColors.transparent.color, style: style ?? BorderStyle.solid, width: width ?? 1);
  static BoxBorder boxBorderDisabled({AppColors? color, BorderStyle? style, double? width}) => BoxBorder.all(color: (color ?? AppColors.disabled).color, style: style ?? BorderStyle.solid, width: width ?? 1);

  /// [Decoration] BoxDecoration
  static BoxDecoration boxDecoration({BoxShape? boxShape, BorderRadius? borderRadius, AppColors? color, BoxBorder? inputBoxBorder, DecorationImage? image, Gradient? gradient}) =>
      BoxDecoration(borderRadius: borderRadius ?? borderRadiusCircular(), color: (color ?? AppColors.primary).color, shape: boxShape ?? BoxShape.rectangle, border: inputBoxBorder ?? boxBorder(color: color), image: image, gradient: gradient);

  /// [Border] OutlineInputBorder
  static OutlineInputBorder outlineInputBorder({BorderRadius? borderRadius, BorderSide? inputBorderSide}) => OutlineInputBorder(borderRadius: borderRadius ?? borderRadiusCircular(), borderSide: inputBorderSide ?? borderSide());
  static OutlineInputBorder outlineInputBorderError({BorderStyle? borderStyle, double? width}) => outlineInputBorder(inputBorderSide: borderSideError(borderStyle: borderStyle, width: width));
  static OutlineInputBorder outlineInputBorderTransparent({BorderStyle? borderStyle, double? width}) => outlineInputBorder(inputBorderSide: borderSideTransparent(borderStyle: borderStyle, width: width));
  static OutlineInputBorder outlineInputBorderFocused({BorderStyle? borderStyle, double? width}) => outlineInputBorder(inputBorderSide: borderSideFocused(borderStyle: borderStyle, width: width));
  static OutlineInputBorder outlineInputBorderDisabled({BorderStyle? borderStyle, double? width}) => outlineInputBorder(inputBorderSide: borderSideDisabled(borderStyle: borderStyle, width: width));

  /// [Border] RoundedRectangleBorder
  static RoundedRectangleBorder roundedRectangleBorder({AppColors? color, BorderStyle? style, double? width}) => RoundedRectangleBorder(
    borderRadius: borderRadiusCircular(),
    side: borderSide(color: color, borderStyle: style, width: width),
  );

  static RoundedRectangleBorder roundedRectangleBorderTop({AppColors? color, BorderStyle? style, double? width}) => RoundedRectangleBorder(
    borderRadius: borderRadiusCircularTop(),
    side: borderSide(color: color, borderStyle: style, width: width),
  );

  static RoundedRectangleBorder roundedRectangleBorderBottom({AppColors? color, BorderStyle? style, double? width}) => RoundedRectangleBorder(
    borderRadius: borderRadiusCircularBottom(),
    side: borderSide(color: color, borderStyle: style, width: width),
  );

  /// Custom UI Kit
  static BoxDecoration get boxDecorationDefault => boxDecoration(inputBoxBorder: boxBorder());
  static BoxDecoration get boxDecorationButton => boxDecoration(inputBoxBorder: boxBorderTransparent(), color: AppColors.transparent);

  static RoundedRectangleBorder get borderModal => roundedRectangleBorderTop();
  static RoundedRectangleBorder get borderAlertDialog => roundedRectangleBorder();
  static RoundedRectangleBorder get borderOutline => roundedRectangleBorder();
  static RoundedRectangleBorder get borderButton => roundedRectangleBorder(color: AppColors.transparent);
}
