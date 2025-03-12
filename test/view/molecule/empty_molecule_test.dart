import 'package:app/const/value_const.dart';
import 'package:app/view/molecule/empty_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EmptyMolecule should display title and optional description', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => const Scaffold(
            body: EmptyMolecule(
              title: 'No Data Available',
              desc: 'Please check back later.',
            ),
          ),
        ),
      ),
    );

    expect(find.text('No Data Available'), findsOneWidget);
    expect(find.text('Please check back later.'), findsOneWidget);
  });
}
