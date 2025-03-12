import 'package:app/const/value_const.dart';
import 'package:app/model/photo_model.dart';
import 'package:app/view/molecule/photo_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
  });

  testWidgets('PhotoMolecule renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => Scaffold(
            body: PhotoMolecule(
              data: PhotoModel(
                albumId: 1,
                id: 1,
                title: 'Photo 1',
                url: 'url_dummy',
                thumbnailUrl: 'url_dummy'
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Photo 1'), findsOneWidget);
  });
}
