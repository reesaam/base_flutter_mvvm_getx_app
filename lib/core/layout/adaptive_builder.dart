import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import 'app_breakpoints.dart';

export 'layout_model.dart';

class LayoutScope extends InheritedWidget {
  const LayoutScope({
    super.key,
    required this.layout,
    required super.child,
  });

  final LayoutModel layout;

  static LayoutModel of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LayoutScope>();
    assert(scope != null, 'LayoutScope not found. Wrap the screen with LayoutScope / AdaptiveHost.');
    return scope!.layout;
  }

  static LayoutModel? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LayoutScope>()?.layout;

  @override
  bool updateShouldNotify(LayoutScope oldWidget) => layout != oldWidget.layout;
}

class AdaptiveHost extends StatelessWidget {
  const AdaptiveHost({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final layout = LayoutModel.fromSize(media.size, orientation: media.orientation);
    return LayoutScope(layout: layout, child: child);
  }
}

class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.layout,
  });

  final AdaptiveWidgetBuilder mobile;
  final AdaptiveWidgetBuilder? tablet;
  final AdaptiveWidgetBuilder? desktop;

  final LayoutModel? layout;

  @override
  Widget build(BuildContext context) {
    final resolved = layout ?? LayoutScope.maybeOf(context) ?? LayoutModel.of(context);
    final builder = switch (resolved.deviceType) {
      DeviceType.mobile => mobile,
      DeviceType.tablet => tablet ?? mobile,
      DeviceType.desktop => desktop ?? tablet ?? mobile,
    };
    return builder(context, resolved);
  }
}

class AdaptiveValue<T> {
  const AdaptiveValue({
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final T mobile;
  final T? tablet;
  final T? desktop;

  T resolve(LayoutModel layout) => switch (layout.deviceType) {
        DeviceType.mobile => mobile,
        DeviceType.tablet => tablet ?? mobile,
        DeviceType.desktop => desktop ?? tablet ?? mobile,
      };

  T resolveOf(BuildContext context) => resolve(LayoutScope.maybeOf(context) ?? LayoutModel.of(context));
}

extension LayoutContextX on BuildContext {
  LayoutModel get layout => LayoutScope.maybeOf(this) ?? LayoutModel.of(this);

  DeviceType get deviceType => layout.deviceType;
  bool get isMobileLayout => layout.isMobile;
  bool get isTabletLayout => layout.isTablet;
  bool get isDesktopLayout => layout.isDesktop;
}
