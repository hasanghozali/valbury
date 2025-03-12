import 'package:app/const/value_const.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/view/atom/shadow_atom.dart';
import 'package:app/view/atom/color_atom.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('ShadowAtom Tests', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (_, __) => const SizedBox(),
          ),
        ),
      ),
    );

    expect(ShadowAtom.drop.offset, Offset(4.r, 4.r));
    expect(ShadowAtom.drop.blurRadius, 10.r);
    expect(ShadowAtom.drop.spreadRadius, 0);
    expect(ShadowAtom.drop.color, ColorAtom.black3);

    expect(ShadowAtom.bottomBar.offset, Offset(0, -6.r));
    expect(ShadowAtom.bottomBar.blurRadius, 10.r);
    expect(ShadowAtom.bottomBar.spreadRadius, 0);
    expect(ShadowAtom.bottomBar.color, ColorAtom.black3);

    expect(ShadowAtom.card.offset, Offset(4.r, 4.r));
    expect(ShadowAtom.card.blurRadius, 15.r);
    expect(ShadowAtom.card.spreadRadius, 0);
    expect(ShadowAtom.card.color, ColorAtom.black3);
  });
}
