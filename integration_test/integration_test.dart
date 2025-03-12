import 'package:app/const/value_const.dart';
import 'package:app/controller/connection_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/atom/image_atom.dart';
import 'package:app/view/atom/scaffold_atom.dart';
import 'package:app/view/atom/switch_atom.dart';
import 'package:app/view/page/login_page.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> tapMenu(WidgetTester tester, String label) async {
    await tester.tap(find.text(label));
    await tester.pumpAndSettle();
  }

  Future<void> retry(WidgetTester tester) async {
    final retry = find.text(S().login);
    if (retry.hasFound) {
      await tester.tap(retry);
      await tester.pumpAndSettle();
    }
  }

  Future<void> login(WidgetTester tester) async {
    expect(find.text(S().welcome), findsOneWidget);
    expect(find.text(S().email), findsOneWidget);
    expect(find.text(S().password), findsOneWidget);
    expect(find.text(S().login), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'johndoe@test.com');
    await tester.enterText(find.byType(TextField).at(1), 'wednesday');
    await tester.pumpAndSettle();
    await tester.tap(find.byType(ScaffoldAtom));
    await tester.pumpAndSettle();
    await tester.tap(find.text(S().login));
    await tester.pumpAndSettle();
  }

  Future<void> tapItem(WidgetTester tester, int index) async {
    await tester.tap(find.byType(Container).at(index));
    await tester.pumpAndSettle();
  }

  Future<void> favoriteDetail(WidgetTester tester) async {
    await retry(tester);
    await tester.tap(find.byType(IconButton).at(0));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
    await tester.pumpAndSettle();
    await retry(tester);
    await tester.tap(find.byType(IconButton).at(1));
    await tester.pumpAndSettle();
  }

  testWidgets('Integration Test', (WidgetTester tester) async {
    Get.put(ConnectionController());

    await tester.pumpWidget(ScreenUtilInit(
      designSize: ValueConst.designSize,
      builder: (context, child) => GetMaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const LoginPage(),
      ),
    ));
    await tester.pumpAndSettle();

    await login(tester);

    await tapItem(tester, 0);

    await favoriteDetail(tester);

    await tapMenu(tester, S().albums);

    await tapItem(tester, 0);

    await favoriteDetail(tester);

    await tapMenu(tester, S().favorites);

    await tapItem(tester, 1);

    await favoriteDetail(tester);

    await tester.drag(find.byType(TabBarView), const Offset(-300, 0));
    await tester.pumpAndSettle();

    await tapItem(tester, 1);

    await favoriteDetail(tester);

    await tester.tap(find.byType(ImageAtom).at(0));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(SwitchAtom));
    await tester.pumpAndSettle(const Duration(seconds: 4));

    await tester.tap(find.widgetWithText(FilledButton, S().logout));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithIcon(FilledButton, IconsaxOutline.finger_scan));
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
