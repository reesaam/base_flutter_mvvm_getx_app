import '../../../barrels/core_resources_barrel.dart';

enum AppElementRadius {
  low(radius: 10),
  normal(radius: 20),
  high(radius: 30),
  snackbar(elementRadius: high),
  zero(radius: 0);

  final double? radius;
  final AppElementRadius? elementRadius;

  const AppElementRadius({this.radius, this.elementRadius})
    : assert(radius != null || elementRadius != null, AppAssertTexts.appElementRadiusInputCheck);

  /// To get an Absolute not Nullable amount of Radius
  double get getRadius => elementRadius?.radius ?? radius ?? 20;
}
