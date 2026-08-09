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

/// UI factory that selects mobile / tablet / desktop builders from [LayoutModel].
///
/// Fallback chain: desktop → tablet → mobile (first non-null wins for the
/// current device, walking down the chain).
class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.layout,
  });

  /// Required baseline builder (phones and ultimate fallback).
  final AdaptiveWidgetBuilder mobile;

  /// Optional tablet builder; falls back to [mobile].
  final AdaptiveWidgetBuilder? tablet;

  /// Optional desktop builder; falls back to [tablet] then [mobile].
  final AdaptiveWidgetBuilder? desktop;

  /// Optional explicit layout. When null, uses [LayoutScope] or computes once.
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

/// Sugar for selecting a value by device type without building widgets.
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
  /// Layout snapshot from the nearest [LayoutScope], or computed from [MediaQuery].
  LayoutModel get layout => LayoutScope.maybeOf(this) ?? LayoutModel.of(this);

  DeviceType get deviceType => layout.deviceType;
  bool get isMobileLayout => layout.isMobile;
  bool get isTabletLayout => layout.isTablet;
  bool get isDesktopLayout => layout.isDesktop;
}
