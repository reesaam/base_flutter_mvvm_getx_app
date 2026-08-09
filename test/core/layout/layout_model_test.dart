import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:base_flutter_mvvm_getx_app/core/core_layout/app_breakpoints.dart';
import 'package:base_flutter_mvvm_getx_app/core/core_layout/adaptive_builder.dart';

void main() {
  group('DeviceType.fromWidth', () {
    test('mobile below tablet breakpoint', () {
      expect(DeviceType.fromWidth(599), DeviceType.mobile);
    });

    test('tablet from 600 inclusive to below desktop', () {
      expect(DeviceType.fromWidth(600), DeviceType.tablet);
      expect(DeviceType.fromWidth(1023), DeviceType.tablet);
    });

    test('desktop at 1024+', () {
      expect(DeviceType.fromWidth(1024), DeviceType.desktop);
      expect(DeviceType.fromWidth(1600), DeviceType.desktop);
    });
  });

  group('LayoutModel.fromSize', () {
    test('computes mobile metrics', () {
      final layout = LayoutModel.fromSize(const Size(390, 844));
      expect(layout.isMobile, isTrue);
      expect(layout.columns, AppBreakpoints.columnsMobile);
      expect(layout.gutter, AppBreakpoints.gutterMobile);
      expect(layout.isLargeDesktop, isFalse);
    });

    test('computes desktop metrics and large flag', () {
      final layout = LayoutModel.fromSize(const Size(1500, 900));
      expect(layout.isDesktop, isTrue);
      expect(layout.isLargeDesktop, isTrue);
      expect(layout.columns, AppBreakpoints.columnsDesktop);
      expect(layout.contentMaxWidth, AppBreakpoints.contentLargeDesktop);
    });
  });

  group('AdaptiveValue', () {
    test('falls back through orElse then other breakpoints', () {
      const withMobile = AdaptiveValue<int>(mobile: 1, tablet: 2);
      expect(withMobile.resolve(LayoutModel.fromSize(const Size(400, 800))), 1);
      expect(withMobile.resolve(LayoutModel.fromSize(const Size(800, 800))), 2);
      expect(withMobile.resolve(LayoutModel.fromSize(const Size(1200, 800))), 2);

      const webFirst = AdaptiveValue<int>(desktop: 3, tablet: 2);
      expect(webFirst.resolve(LayoutModel.fromSize(const Size(400, 800))), 2);
      expect(webFirst.resolve(LayoutModel.fromSize(const Size(800, 800))), 2);
      expect(webFirst.resolve(LayoutModel.fromSize(const Size(1200, 800))), 3);

      const withDefault = AdaptiveValue<int>(orElse: 0, desktop: 9);
      expect(withDefault.resolve(LayoutModel.fromSize(const Size(400, 800))), 0);
      expect(withDefault.resolve(LayoutModel.fromSize(const Size(1200, 800))), 9);
    });
  });

  group('AdaptiveBuilder.resolveBuilder', () {
    test('requires no specific mobile when desktop/orElse exist', () {
      const builder = AdaptiveBuilder(desktop: _box, orElse: _box);
      expect(builder.resolveBuilder(DeviceType.mobile), isNotNull);
      expect(builder.resolveBuilder(DeviceType.desktop), isNotNull);
    });
  });
}

Widget _box(BuildContext context, LayoutModel layout) => const SizedBox.shrink();
