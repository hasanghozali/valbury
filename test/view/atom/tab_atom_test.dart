import 'package:app/const/value_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/model/menu_model.dart';
import 'package:app/view/atom/tab_atom.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('TabAtom should render correctly', (WidgetTester tester) async {
    final tabs = [
      MenuModel(label: 'Tab 1'),
      MenuModel(label: 'Tab 2'),
      MenuModel(label: 'Tab 3'),
    ];
    final controller = TabController(length: tabs.length, vsync: tester);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (_, __) => TabAtom(controller: controller, tabs: tabs),
          ),
        ),
      ),
    );

    for (final tab in tabs) {
      expect(find.text(tab.label), findsOneWidget);
    }
  });

  testWidgets('TabAtom should change tab on tap', (WidgetTester tester) async {
    final tabs = [
      MenuModel(label: 'Tab 1'),
      MenuModel(label: 'Tab 2'),
    ];
    final controller = TabController(length: tabs.length, vsync: tester);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (_, __) => TabAtom(controller: controller, tabs: tabs),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Tab 2'));
    await tester.pumpAndSettle();
    
    expect(controller.index, 1);
  });
}