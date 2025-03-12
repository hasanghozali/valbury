import 'package:app/const/value_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/view/atom/switch_atom.dart';

void main() {
  group('SwitchAtom Tests', () {
    testWidgets('SwitchAtom renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreenUtilInit(
              designSize: ValueConst.designSize,
              builder: (_, __) => const SwitchAtom(),
            ),
          ),
        ),
      );

      expect(find.byType(SwitchAtom), findsOneWidget);
    });

    testWidgets('SwitchAtom toggles state when tapped', (WidgetTester tester) async {
      bool switchValue = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScreenUtilInit(
              designSize: ValueConst.designSize,
              builder: (_, __) => SwitchAtom(
                value: switchValue,
                onChanged: (newValue) {
                  switchValue = newValue;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SwitchAtom));
      await tester.pump();

      expect(switchValue, true);
    });
  });
}
