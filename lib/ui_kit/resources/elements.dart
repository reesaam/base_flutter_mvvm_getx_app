import '../../barrels/core_resources_barrel.dart';
import '../../barrels/ui_kit_barrel.dart';

enum AppElementRadius {
  low(radius: 10),
  normal(radius: 20),
  high(radius: 30),
  zero(radius: 0);

  final double radius;

  const AppElementRadius({required this.radius});

  double get getDefault => low.radius;


  /// Radius
  Radius circularRadius() => Radius.circular(radius);
  BorderRadius borderCircularRadius() => BorderRadius.all(circularRadius());
  BorderRadius borderCircularRadiusTop() => BorderRadius.only(topLeft: circularRadius(), topRight: circularRadius());
  BorderRadius borderCircularRadiusBottom() => BorderRadius.only(bottomLeft: circularRadius(), bottomRight: circularRadius());

  /// BorderSide
  BorderSide borderSide({AppColors? color, BorderStyle? borderStyle, double? width}) => BorderSide(color: (color ?? AppColors.primary).color, style: borderStyle ?? BorderStyle.solid, width: width ?? 1);
  BorderSide borderSideError({BorderStyle? borderStyle, double? width}) => borderSide(color: AppColors.error, borderStyle: borderStyle, width: width);
  BorderSide borderSideTransparent({BorderStyle? borderStyle, double? width}) => borderSide(color: AppColors.transparent, borderStyle: borderStyle, width: width);
  BorderSide borderSideFocused({BorderStyle? borderStyle, double? width}) => borderSide(color: AppColors.primary, borderStyle: borderStyle, width: width);
  BorderSide borderSideDisabled({BorderStyle? borderStyle, double? width}) => borderSide(color: AppColors.disabled, borderStyle: borderStyle, width: width);


  /// [Border] BoxBorder
  BoxBorder boxBorder({AppColors? color, BorderStyle? style, double? width}) => BoxBorder.all(color: (color ?? AppColors.primary).color, style: style ?? BorderStyle.solid, width: width ?? 1);

  BoxBorder boxBorderError({AppColors? color, BorderStyle? style, double? width}) => BoxBorder.all(color: (color ?? AppColors.error).color, style: style ?? BorderStyle.solid, width: width ?? 1);
  BoxBorder boxBorderTransparent({AppColors? color, BorderStyle? style, double? width}) => BoxBorder.all(color: (color ?? AppColors.transparent).color, style: style ?? BorderStyle.solid, width: width ?? 1);
  BoxBorder boxBorderDisabled({AppColors? color, BorderStyle? style, double? width}) => BoxBorder.all(color: (color ?? AppColors.disabled).color, style: style ?? BorderStyle.solid, width: width ?? 1);

  /// [Decoration] BoxDecoration
  BoxDecoration boxDecoration({BoxShape? boxShape, BorderRadius? borderRadius, BoxBorder? boxBorder, DecorationImage? image, Gradient? gradient}) =>
      BoxDecoration(borderRadius: borderRadius ?? borderCircularRadius(), color: AppColors.primary.color, shape: boxShape ?? BoxShape.rectangle,border: boxBorder ?? this.boxBorder(), image: image, gradient: gradient);

  /// [Border] OutlineInputBorder
  OutlineInputBorder outlineInputBorder({BorderRadius? borderRadius, BorderSide? borderSide}) => OutlineInputBorder(borderRadius: borderRadius ?? borderCircularRadius(), borderSide: borderSide ?? this.borderSide());
  OutlineInputBorder outlineInputBorderError({BorderStyle? borderStyle, double? width}) => outlineInputBorder(borderSide: borderSideError(borderStyle: borderStyle, width: width));
  OutlineInputBorder outlineInputBorderTransparent({BorderStyle? borderStyle, double? width}) => outlineInputBorder(borderSide: borderSideTransparent(borderStyle: borderStyle, width: width));
  OutlineInputBorder outlineInputBorderFocused({BorderStyle? borderStyle, double? width}) => outlineInputBorder(borderSide: borderSideFocused(borderStyle: borderStyle, width: width));
  OutlineInputBorder outlineInputBorderDisabled({BorderStyle? borderStyle, double? width}) => outlineInputBorder(borderSide: borderSideDisabled(borderStyle: borderStyle, width: width));

  /// [Border] RoundedRectangleBorder
  RoundedRectangleBorder roundedRectangleBorder({AppColors? color, BorderStyle? style, double? width}) => RoundedRectangleBorder(
    borderRadius: borderCircularRadius(),
    side: borderSide(color: color, borderStyle: style, width: width),
  );

  RoundedRectangleBorder roundedRectangleBorderTop({AppColors? color, BorderStyle? style, double? width}) => RoundedRectangleBorder(
    borderRadius: borderCircularRadiusTop(),
    side: borderSide(color: color, borderStyle: style, width: width),
  );

  RoundedRectangleBorder roundedRectangleBorderBottom({AppColors? color, BorderStyle? style, double? width}) => RoundedRectangleBorder(
    borderRadius: borderCircularRadiusBottom(),
    side: borderSide(color: color, borderStyle: style, width: width),
  );

  /// Custom UI Kit
  BoxDecoration get boxDecorationDefault => boxDecoration(boxBorder: boxBorderTransparent());

  RoundedRectangleBorder get borderModal => roundedRectangleBorderTop();
  RoundedRectangleBorder get borderAlertDialog => roundedRectangleBorder();
  RoundedRectangleBorder get borderOutline => roundedRectangleBorder();
  RoundedRectangleBorder get borderButton => roundedRectangleBorder(color: AppColors.transparent);
}
