import '../barrels/ui_kit_barrel.dart';

class AppCard extends BaseWidget {
  const AppCard._({
    super.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground,
    this.clipBehavior,
    this.margin,
    this.semanticContainer,
    this.padding,
    this.child,
  });

  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool? borderOnForeground;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? margin;
  final bool? semanticContainer;
  final EdgeInsets? padding;
  final Widget? child;

  factory AppCard.primary({
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool? borderOnForeground,
    Clip? clipBehavior,
    EdgeInsetsGeometry? margin,
    bool? semanticContainer,
    EdgeInsets? padding,
    required Widget child,
  }) => AppCard._(
    color: color,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    elevation: elevation,
    shape: shape,
    borderOnForeground: borderOnForeground,
    clipBehavior: clipBehavior,
    margin: margin,
    semanticContainer: semanticContainer,
    padding: padding,
    child: child,
  );

  factory AppCard.outline({
    Color? borderColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool? borderOnForeground,
    Clip? clipBehavior,
    EdgeInsetsGeometry? margin,
    bool? semanticContainer,
    EdgeInsets? padding,
    required Widget child,
  }) => AppCard._(
    color: AppColors.background.color,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    elevation: elevation,
    shape: AppElements.borderShapeOutline,
    borderOnForeground: borderOnForeground,
    clipBehavior: clipBehavior,
    margin: margin,
    semanticContainer: semanticContainer,
    padding: padding,
    child: child,
  );

  @override
  Widget get widget => Padding(
    padding: padding ?? AppPaddings.zero,
    child: Card(
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      margin: margin,
      borderOnForeground: borderOnForeground ?? true,
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer ?? true,
      child: child,
    ),
  );
}
