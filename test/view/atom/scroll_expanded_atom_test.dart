import 'package:app/const/value_const.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/view/atom/scroll_expanded_atom.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('ScrollExpandedAtom renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (context, child) => ScrollExpandedAtom(
              padding: REdgeInsets.all(20),
              isList: false,
              child: Column(
                children: List.generate(20, (index) => const Text('Item \$index')),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(ScrollExpandedAtom), findsOneWidget);
  });

  testWidgets('ScrollExpandedAtom scrolls correctly', (WidgetTester tester) async {
    final controller = ScrollController();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (context, child) => ScrollExpandedAtom(
              padding: REdgeInsets.all(20),
              isList: true,
              controller: controller,
              child: Column(
                children: List.generate(50, (index) => const Text('Item \$index')),
              ),
            ),
          ),
        ),
      ),
    );

    expect(controller.offset, 0);
    controller.jumpTo(100);
    await tester.pump();
    expect(controller.offset, 100);
  });
}
