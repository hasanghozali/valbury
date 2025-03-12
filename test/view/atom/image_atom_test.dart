import 'package:app/const/value_const.dart';
import 'package:app/view/atom/image_atom.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('ImageAtom renders correctly', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: ValueConst.designSize,
            builder: (context, child) => Scaffold(
              body: Column(
                children: [
                  ImageAtom(
                    url: 'local_file',
                    height: 2.r,
                  ),
                  ImageAtom(
                    url: '${ValueConst.schemeUrl}url_dummy',
                    height: 2.r,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 10));

      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}
