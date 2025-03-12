import 'package:app/const/value_const.dart';
import 'package:app/view/atom/scaffold_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  Widget createWidgetUnderTest({String? title, Widget? appBarSpace, bool showLeading = true, List<Widget>? actions}) {
    return ScreenUtilInit(
      designSize: ValueConst.designSize,
      builder: (context, child) {
        return GetMaterialApp(
          home: ScaffoldAtom(
            title: title,
            showLeading: showLeading,
            actions: actions,
            appBarSpace: appBarSpace,
            body: const Text('Body Content'),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: BottomAppBar(
              child: SizedBox(height: 50.h, child: const Text('Bottom Bar')),
            ),
          ),
        );
      },
    );
  }

  testWidgets('Displays AppBar with correct title', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(title: 'Test Title'));

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('Hides AppBar when title is null', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(title: null));

    expect(find.byType(AppBar), findsNothing);
  });

  testWidgets('Displays back button when showLeading is true', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(title: 'Test Title', showLeading: true));

    expect(find.byType(IconButton), findsOneWidget);

    await tester.tap(find.byType(IconButton));
    await tester.pump();
  });

  testWidgets('Hides back button when showLeading is false', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(title: 'Test Title', showLeading: false));

    expect(find.byType(IconButton), findsNothing);
  });

  testWidgets('Displays actions when provided', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(
      title: 'Test Title',
      actions: [const Icon(Icons.settings)],
    ));

    expect(find.byIcon(Icons.settings), findsOneWidget);
  });

  testWidgets('Displays floatingActionButton when provided', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(title: 'Test Title'));

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Displays bottomNavigationBar when provided', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(title: 'Test Title'));

    expect(find.text('Bottom Bar'), findsOneWidget);
  });

  testWidgets('Displays body content correctly', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest(appBarSpace: const SizedBox()));

    expect(find.text('Body Content'), findsOneWidget);
  });
}
