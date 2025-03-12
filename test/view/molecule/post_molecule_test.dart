import 'package:app/const/value_const.dart';
import 'package:app/controller/post_controller.dart';
import 'package:app/model/post_model.dart';
import 'package:app/view/molecule/post_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
    Get.put(PostController());
  });
  
  testWidgets('PostMolecule renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => Scaffold(
            body: PostMolecule(
              data: PostModel(
                userId: 1,
                id: 1,
                title: 'Title 1',
                body: 'Body 1',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Title 1'), findsOneWidget);
    expect(find.text('Body 1'), findsOneWidget);
    await tester.tap(find.byType(IconButton));
    await tester.pump();
    await tester.tap(find.byType(Container));
  });
}
