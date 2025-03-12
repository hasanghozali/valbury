import 'package:app/const/value_const.dart';
import 'package:app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:app/controller/account_controller.dart';
import 'package:app/view/atom/language_atom.dart';

void main() {
  late AccountController accountController;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
    accountController = Get.put(AccountController());
  });

  testWidgets('LanguageAtom renders correctly and triggers locale change', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => GetMaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const Scaffold(
              body: LanguageAtom(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(Container), findsOneWidget);

      await tester.tap(find.byType(Container));
      await tester.pumpAndSettle();

      expect(accountController.changeLocale, isNotNull);
    });
  });
}
