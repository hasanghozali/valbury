import 'package:app/const/value_const.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/view/atom/text_field_atom.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('TextFieldAtom should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (_, __) => const TextFieldAtom(
              title: 'Title',
              subtitle: 'Subtitle',
              hintText: 'Enter text',
              suffixIcon: IconsaxOutline.add,
              prefixIcon: IconsaxOutline.minus,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.text('Enter text'), findsOneWidget);
    expect(find.byIcon(IconsaxOutline.add), findsOneWidget);
    expect(find.byIcon(IconsaxOutline.minus), findsOneWidget);
  });

  testWidgets('TextFieldAtom should accept input', (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (_, __) => TextFieldAtom(
              controller: controller,
              hintText: 'Enter text',
              suffixIcon: IconsaxOutline.add,
            ),
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Scaffold));
    await tester.pumpAndSettle();
    expect(controller.text, 'Hello');
  });

  testWidgets('TextFieldAtom should toggle obscure text', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (_, __) => const TextFieldAtom(
              withObscure: true,
            ),
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Hello');

    final eyeIcon = find.byType(IconButton);

    expect(find.text(''), findsNothing);
    
    await tester.tap(eyeIcon);
    await tester.pump();

    expect(find.text('Hello'), findsOneWidget);
  });
}
