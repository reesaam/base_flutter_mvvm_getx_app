import 'package:flutter/widgets.dart';

import 'app_breakpoints.dart';

@immutable
class LayoutModel {
  const LayoutModel({
    required this.size,
    required this.deviceType,
    required this.orientation,
    required this.columns,
    required this.gutter,
    required this.pagePadding,
    required this.contentMaxWidth,
    required this.isLargeDesktop,
  });

  final Size size;
  final DeviceType deviceType;
  final Orientation orientation;
  final int columns;
  final double gutter;
  final EdgeInsets pagePadding;
  final double contentMaxWidth;
  final bool isLargeDesktop;

  double get width => size.width;
  double get height => size.height;

  bool get isMobile => deviceType.isMobile;
  bool get isTablet => deviceType.isTablet;
  bool get isDesktop => deviceType.isDesktop;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isCompact => isMobile || height < AppBreakpoints.tablet;

  factory LayoutModel.fromSize(Size size, {Orientation? orientation}) {
    final deviceType = DeviceType.fromWidth(size.width);
    final resolvedOrientation = orientation ??
        (size.width >= size.height ? Orientation.landscape : Orientation.portrait);

    return switch (deviceType) {
      DeviceType.mobile => LayoutModel(
          size: size,
          deviceType: deviceType,
          orientation: resolvedOrientation,
          columns: AppBreakpoints.columnsMobile,
          gutter: AppBreakpoints.gutterMobile,
          pagePadding: const EdgeInsets.symmetric(horizontal: AppBreakpoints.paddingMobile),
          contentMaxWidth: AppBreakpoints.contentMobile,
          isLargeDesktop: false,
        ),
      DeviceType.tablet => LayoutModel(
          size: size,
          deviceType: deviceType,
          orientation: resolvedOrientation,
          columns: AppBreakpoints.columnsTablet,
          gutter: AppBreakpoints.gutterTablet,
          pagePadding: const EdgeInsets.symmetric(horizontal: AppBreakpoints.paddingTablet),
          contentMaxWidth: AppBreakpoints.contentTablet,
          isLargeDesktop: false,
        ),
      DeviceType.desktop => LayoutModel(
          size: size,
          deviceType: deviceType,
          orientation: resolvedOrientation,
          columns: AppBreakpoints.columnsDesktop,
          gutter: AppBreakpoints.gutterDesktop,
          pagePadding: const EdgeInsets.symmetric(horizontal: AppBreakpoints.paddingDesktop),
          contentMaxWidth: size.width >= AppBreakpoints.largeDesktop
              ? AppBreakpoints.contentLargeDesktop
              : AppBreakpoints.contentDesktop,
          isLargeDesktop: size.width >= AppBreakpoints.largeDesktop,
        ),
    };
  }

  /// Convenience from [BuildContext] — prefer [LayoutScope.of] in UI trees.
  factory LayoutModel.of(BuildContext context) {
    final media = MediaQuery.of(context);
    return LayoutModel.fromSize(media.size, orientation: media.orientation);
  }

  /// Wraps [child] in a centered, max-width constrained shell.
  Widget constrainContent(Widget child) {
    if (contentMaxWidth.isInfinite) {
      return Padding(padding: pagePadding, child: child);
    }
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: contentMaxWidth),
        child: Padding(padding: pagePadding, child: child),
      ),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LayoutModel &&
          size == other.size &&
          deviceType == other.deviceType &&
          orientation == other.orientation &&
          columns == other.columns &&
          gutter == other.gutter &&
          pagePadding == other.pagePadding &&
          contentMaxWidth == other.contentMaxWidth &&
          isLargeDesktop == other.isLargeDesktop;

  @override
  int get hashCode => Object.hash(
        size,
        deviceType,
        orientation,
        columns,
        gutter,
        pagePadding,
        contentMaxWidth,
        isLargeDesktop,
      );

  @override
  String toString() =>
      'LayoutModel(deviceType: $deviceType, size: $size, columns: $columns, gutter: $gutter)';
}
