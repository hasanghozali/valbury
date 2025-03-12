import 'package:app/const/value_const.dart';
import 'package:app/view/atom/snackbar_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  setUp(() {
    Get.testMode = true; // Pastikan GetX berjalan dalam mode test
  });

  tearDown(() {
    Get.reset(); // Reset state GetX setelah test selesai
  });

  Widget createWidgetUnderTest() {
    return ScreenUtilInit(
      designSize: ValueConst.designSize,
      builder: (context, child) {
        return const GetMaterialApp(
          home: Scaffold(body: SizedBox()),
        );
      },
    );
  }

  testWidgets('Displays red SnackBar correctly', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    SnackBarAtom.red('Error Message');
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('Displays yellow SnackBar correctly', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    SnackBarAtom.yellow('Warning Message');
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('Displays green SnackBar correctly', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    SnackBarAtom.green('Success Message');
    await tester.pump(const Duration(seconds: 5));
  });
}
