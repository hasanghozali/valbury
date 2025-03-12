import 'package:app/const/icon_const.dart';
import 'package:app/const/value_const.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ButtonAtom Primary renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => Scaffold(
            body: ButtonAtom.primary(
              width: 200.r,
              label: 'Primary Button',
              icon: IconsaxOutline.add,
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Primary Button'), findsOneWidget);
  });

  testWidgets('ButtonAtom Secondary renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => Scaffold(
            body: ButtonAtom.secondary(
              
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Secondary Button'), findsOneWidget);
  });

  testWidgets('ButtonAtom Link renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => Scaffold(
            body: ButtonAtom.link(
              width: 150.w,
              label: 'Link Button',
              onTap: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Link Button'), findsOneWidget);
  });

  testWidgets('ButtonAtom Icon renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => Scaffold(
            body: Column(
              children: [
                ButtonAtom.icon(
                  icon: Icons.home,
                  color: Colors.blue,
                  onTap: () {},
                ),
                ButtonAtom.icon(
                  sourceIcon: IconConst.icFavorite,
                  size: 20.r,
                  color: Colors.blue,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('ButtonAtom Container renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => Scaffold(
            body: ButtonAtom.container(
              width: 200.w,
              height: 50.h,
              color: ColorAtom.primary,
              onTap: () {},
              child: const Text("Container Button"),
            ),
          ),
        ),
      ),
    );

    expect(find.text("Container Button"), findsOneWidget);
  });
}
