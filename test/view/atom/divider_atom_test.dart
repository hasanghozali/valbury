import 'package:app/const/value_const.dart';
import 'package:app/view/atom/divider_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DividerAtom renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => Scaffold(
            body: DividerAtom(
              thickness: 1.r,
              height: 2.r,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(Divider), findsOneWidget);
  });
}