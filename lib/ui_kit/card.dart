import '../barrels/ui_kit_barrel.dart';

class AppCard extends BaseWidget {
  const AppCard({
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
