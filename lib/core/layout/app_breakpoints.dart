
/// Width rules:
/// - mobile:  `< [tablet]`
/// - tablet:  `[tablet]` inclusive … `< [desktop]`
/// - desktop: `≥ [desktop]`
///
abstract final class AppBreakpoints {
  AppBreakpoints._();

  // Device
  static const double tablet = 600;
  static const double desktop = 1024;
  static const double largeDesktop = 1440;

  // Content
  static const double contentMobile = double.infinity;
  static const double contentTablet = 840;
  static const double contentDesktop = 1200;
  static const double contentLargeDesktop = 1400;

  // Paddings
  static const double paddingMobile = 16;
  static const double paddingTablet = 24;
  static const double paddingDesktop = 32;

  // Columns
  static const int columnsMobile = 4;
  static const int columnsTablet = 8;
  static const int columnsDesktop = 12;

  // Gutter
  static const double gutterMobile = 12;
  static const double gutterTablet = 16;
  static const double gutterDesktop = 24;
}

enum DeviceType {
  mobile,
  tablet,
  desktop;

  bool get isMobile => this == DeviceType.mobile;
  bool get isTablet => this == DeviceType.tablet;
  bool get isDesktop => this == DeviceType.desktop;

  /// Resolves [width] against [AppBreakpoints].
  static DeviceType fromWidth(double width) {
    if (width >= AppBreakpoints.desktop) return DeviceType.desktop;
    if (width >= AppBreakpoints.tablet) return DeviceType.tablet;
    return DeviceType.mobile;
  }
}
