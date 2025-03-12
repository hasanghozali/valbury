import 'package:app/const/value_const.dart';
import 'package:app/model/comment_model.dart';
import 'package:app/view/molecule/comment_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.testMode = true;
  });

  testWidgets('CommentMolecule renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: ValueConst.designSize,
          builder: (context, child) => Scaffold(
            body: CommentMolecule(
              data: CommentModel(
                postId: 1,
                id: 1,
                name: 'John',
                email: 'john@email.com',
                body: 'Body 1'
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('John'), findsOneWidget);
    expect(find.text('john@email.com'), findsOneWidget);
    expect(find.text('Body 1'), findsOneWidget);
  });
}
