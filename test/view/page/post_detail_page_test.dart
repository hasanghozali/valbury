import 'package:app/const/value_const.dart';
import 'package:app/controller/comment_controller.dart';
import 'package:app/controller/connection_controller.dart';
import 'package:app/controller/post_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/model/post_model.dart';
import 'package:app/view/molecule/empty_molecule.dart';
import 'package:app/view/molecule/error_molecule.dart';
import 'package:app/view/page/post_detail_page.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';

import '../../controller/fetch_controller_test.dart';

void main() {
  late CommentController commentController;
  late MockFetchProvider mockProvider;

  setUp(() {
    mockProvider = MockFetchProvider();
    commentController = CommentController(provider: mockProvider);
    Get.put<CommentController>(commentController);
    Get.put(PostController());
    Get.put(ConnectionController());
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
          body: PostDetailPage(
            data: PostModel(
              userId: 1,
              id: 1,
              title: 'Post 1',
              body: 'Body 1',
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('PostDetailMolecule displays the post detail correctly', (WidgetTester tester) async {
    when(mockProvider.fetchComments(1)).thenAnswer(
      (_) async => const Response(
        statusCode: 200,
        body: [
          {'postId': 1, 'id': 1, 'name': 'Comment 1', 'email': 'email1@email.com', 'body': 'Body 1'},
          {'postId': 1, 'id': 2, 'name': 'Comment 2', 'email': 'email2@email.com', 'body': 'Body 2'},
        ],
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await commentController.fetchComments(1);
    await tester.pumpAndSettle();

    expect(commentController.comments.length, 2);
    expect(find.text('Comment 1'), findsOneWidget);
    expect(find.text('Comment 2'), findsOneWidget);

    await tester.tap(find.widgetWithIcon(IconButton, IconsaxOutline.heart));
    await tester.pump();
  });

  testWidgets('Displays EmptyMolecule when there is no data', (WidgetTester tester) async {
    when(mockProvider.fetchComments(1)).thenAnswer(
      (_) async => const Response(statusCode: 200, body: []),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await commentController.fetchComments(1);
    await tester.pumpAndSettle();

    expect(find.byType(EmptyMolecule), findsOneWidget);
  });

  testWidgets('Triggers onRefresh from RefreshIndicator', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
    await tester.pumpAndSettle();

    verify(mockProvider.fetchComments(1)).called(1);
  });

  testWidgets('Executes onRetry when an error occurs', (WidgetTester tester) async {
    when(mockProvider.fetchComments(1)).thenThrow(Exception('Network Error'));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();
    await commentController.fetchData(
      () => mockProvider.fetchComments(1),
      (body) => body,
    );
    await tester.pump();

    expect(commentController.errorMessage.value, 'Exception: Network Error');
    expect(find.text('Exception: Network Error'), findsOneWidget);

    await tester.tap(find.widgetWithText(ErrorMolecule, S().retry));
    await tester.pump();
  });
}
