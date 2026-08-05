import '../barrels/ui_kit_barrel.dart';

class AppContainer extends BaseWidget {
  const AppContainer({
    this.color,
    this.height,
    this.width,
    this.alignment,
    this.padding,
    this.margin,
    this.decoration,
    this.foregroundDecoration,
    this.constraints,
    this.clipBehavior,
    this.transform,
    this.transformAlignment,
    this.child,
  });

  final AppColors? color;
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final Clip? clipBehavior;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;

  @override
  Widget get widget => Container(
        color: color?.color ?? AppColors.canvas.color,
        height: height,
        width: width,
        alignment: alignment ?? Alignment.center,
        padding: padding,
        margin: margin,
        decoration: decoration,
        constraints: constraints,
        clipBehavior: clipBehavior ?? Clip.none,
        transform: transform,
        foregroundDecoration: foregroundDecoration,
        transformAlignment: transformAlignment,
        child: child,
      );
}
