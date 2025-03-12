import 'package:app/const/value_const.dart';
import 'package:app/controller/connection_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/molecule/error_molecule.dart';
import 'package:app/view/atom/loading_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockConnectionController extends GetxService with Mock implements ConnectionController {
  @override
  var isInternetAvailable = true.obs;
}

void main() {
  late MockConnectionController mockConnectionController;
  late RxBool isLoading;
  late RxnString errorMessage;
  late bool onRetryCalled;

  setUp(() {
    Get.testMode = true;
    mockConnectionController = MockConnectionController();
    Get.put<ConnectionController>(mockConnectionController);

    isLoading = false.obs;
    errorMessage = RxnString();
    onRetryCalled = false;
  });

  Widget createWidgetUnderTest() {
    return ScreenUtilInit(
      designSize: ValueConst.designSize,
      builder: (context, child) => GetMaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: Scaffold(
          body: Column(
            children: [
              LoadingAtom(
                isLoading: isLoading,
                errorMessage: errorMessage,
                onRetry: () => onRetryCalled = true,
                child: const Text('Success'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  testWidgets('Shows CircularProgressIndicator when loading', (tester) async {
    isLoading.value = true;

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Success'), findsNothing);
  });

  testWidgets('Shows ErrorMolecule when errorMessage is set', (tester) async {
    errorMessage.value = 'Error occurred';

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(ErrorMolecule), findsOneWidget);
    expect(find.text('Error occurred'), findsOneWidget);
    expect(find.text('Success'), findsNothing);
  });

  testWidgets('Calls onRetry automatically when error and internet available', (tester) async {
    errorMessage.value = 'Error occurred';
    mockConnectionController.isInternetAvailable.value = true;

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    expect(onRetryCalled, isTrue);
  });

  testWidgets('Displays child when no loading and no error', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Success'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(ErrorMolecule), findsNothing);
  });
}
