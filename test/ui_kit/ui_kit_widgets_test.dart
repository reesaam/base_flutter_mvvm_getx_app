import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:base_flutter_mvvm_getx_app/ui_kit/core_box.dart';
import 'package:base_flutter_mvvm_getx_app/ui_kit/progress_indicator.dart';
import 'package:base_flutter_mvvm_getx_app/ui_kit/check_box.dart';
import 'package:base_flutter_mvvm_getx_app/ui_kit/switch.dart';
import 'package:base_flutter_mvvm_getx_app/ui_kit/divider.dart';
import 'package:base_flutter_mvvm_getx_app/ui_kit/resources/spaces.dart';

Widget _wrap(Widget child) => GetMaterialApp(
      home: Scaffold(body: child),
    );

void main() {
  group('AppBox', () {
    testWidgets('renders sized child', (tester) async {
      await tester.pumpWidget(_wrap(AppBox(width: 40, height: 20, child: const Text('box'))));
      expect(find.text('box'), findsOneWidget);
      final sized = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sized.width, 40);
      expect(sized.height, 20);
    });

    testWidgets('shrink renders SizedBox.shrink', (tester) async {
      await tester.pumpWidget(_wrap(AppBox.shrink()));
      expect(find.byType(SizedBox), findsWidgets);
    });
  });

  group('AppProgressIndicator', () {
    testWidgets('circular builds without throwing', (tester) async {
      await tester.pumpWidget(_wrap(AppProgressIndicator.circular()));
      expect(tester.takeException(), isNull);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('linear builds without throwing', (tester) async {
      await tester.pumpWidget(_wrap(AppProgressIndicator.linear()));
      expect(tester.takeException(), isNull);
      expect(find.byType(SizedBox), findsWidgets);
    });
  });

  group('AppCheckBox', () {
    testWidgets('toggles via onChanged', (tester) async {
      bool? value = false;
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => AppCheckBox(
              value: value!,
              onChanged: (v) => setState(() => value = v),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(value, isTrue);
    });
  });

  group('AppSwitch', () {
    testWidgets('invokes onChanged', (tester) async {
      var value = false;
      await tester.pumpWidget(
        _wrap(
          StatefulBuilder(
            builder: (context, setState) => AppSwitch(
              value: value,
              onChanged: (v) => setState(() => value = v as bool),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(value, isTrue);
    });
  });

  group('AppDividers', () {
    testWidgets('general divider renders', (tester) async {
      await tester.pumpWidget(_wrap(AppDividers.general()));
      expect(find.byType(Divider), findsOneWidget);
    });
  });

  group('AppSpaces', () {
    testWidgets('h10 creates vertical space', (tester) async {
      await tester.pumpWidget(_wrap(AppSpaces.h10));
      expect(find.byType(SizedBox), findsWidgets);
    });
  });
}
