import '../../barrels/core_barrel.dart';
import '../../barrels/core_resources_barrel.dart';
import 'app_breakpoints.dart';

export 'layout_model.dart';

class LayoutScope extends InheritedWidget {
  const LayoutScope({super.key, required this.layout, required super.child});

  final LayoutModel layout;

  static LayoutModel of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LayoutScope>();
    assert(scope != null, 'LayoutScope not found. Wrap the screen with LayoutScope / AdaptiveHost.');
    return scope!.layout;
  }

  static LayoutModel? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType<LayoutScope>()?.layout;

  @override
  bool updateShouldNotify(LayoutScope oldWidget) => layout != oldWidget.layout;
}

class AdaptiveHost extends StatelessWidget {
  const AdaptiveHost({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final layout = LayoutModel.fromSize(media.size, orientation: media.orientation);
    return LayoutScope(layout: layout, child: child);
  }
}

/// Any of [mobile] / [tablet] / [desktop] / [orElse] may be null, but **at least one** must be non-null.
/// Unset breakpoints fall back to [orElse], then to any
class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({super.key, this.mobile, this.tablet, this.desktop, this.orElse, this.layout})
    : assert(
        mobile != null || tablet != null || desktop != null || orElse != null,
        'AdaptiveBuilder requires at least one of: mobile, tablet, desktop, orElse.',
      );

  final AdaptiveWidgetBuilder? mobile;
  final AdaptiveWidgetBuilder? tablet;
  final AdaptiveWidgetBuilder? desktop;

  /// Default when the active breakpoint builder is null.
  final AdaptiveWidgetBuilder? orElse;

  final LayoutModel? layout;

  @override
  Widget build(BuildContext context) {
    final resolved = layout ?? LayoutScope.maybeOf(context) ?? LayoutModel.of(context);
    final builder = resolveBuilder(resolved.deviceType);
    return builder(context, resolved);
  }

  AdaptiveWidgetBuilder resolveBuilder(DeviceType deviceType) {
    final preferred = switch (deviceType) {
      DeviceType.mobile => [mobile, orElse, tablet, desktop],
      DeviceType.tablet => [tablet, orElse, mobile, desktop],
      DeviceType.desktop => [desktop, orElse, tablet, mobile],
    };
    return preferred.whereType<AdaptiveWidgetBuilder>().first;
  }
}

class AdaptiveValue<T> {
  const AdaptiveValue({this.mobile, this.tablet, this.desktop, this.orElse})
    : assert(
        mobile != null || tablet != null || desktop != null || orElse != null,
        'AdaptiveValue requires at least one of: mobile, tablet, desktop, orElse.',
      );

  final T? mobile;
  final T? tablet;
  final T? desktop;
  final T? orElse;

  T resolve(LayoutModel layout) {
    final preferred = switch (layout.deviceType) {
      DeviceType.mobile => [mobile, orElse, tablet, desktop],
      DeviceType.tablet => [tablet, orElse, mobile, desktop],
      DeviceType.desktop => [desktop, orElse, tablet, mobile],
    };
    return preferred.whereType<T>().first;
  }

  T resolveOf(BuildContext context) => resolve(LayoutScope.maybeOf(context) ?? LayoutModel.of(context));
}

extension LayoutContextX on BuildContext {
  LayoutModel get layout => LayoutScope.maybeOf(this) ?? LayoutModel.of(this);

  DeviceType get deviceType => layout.deviceType;

  bool get isMobileLayout => layout.isMobile;

  bool get isTabletLayout => layout.isTablet;

  bool get isDesktopLayout => layout.isDesktop;
}
