import 'package:app/const/value_const.dart';
import 'package:app/controller/connection_controller.dart';
import 'package:app/controller/post_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/molecule/empty_molecule.dart';
import 'package:app/view/molecule/post_list_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';

import '../../controller/fetch_controller_test.dart';

void main() {
  late PostController postController;
  late MockFetchProvider mockProvider;

  setUp(() {
    mockProvider = MockFetchProvider();
    postController = PostController(provider: mockProvider);
    Get.put<PostController>(postController);
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
        home: const Scaffold(
          body: PostListMolecule(withTitle: true),
        ),
      ),
    );
  }

  testWidgets('PostListMolecule displays the post list correctly', (WidgetTester tester) async {
    when(mockProvider.fetchPosts()).thenAnswer(
      (_) async => const Response(
        statusCode: 200,
        body: [
          {'userId': 1, 'id': 1, 'title': 'Post 1', 'body': 'Body 1'},
          {'userId': 1, 'id': 2, 'title': 'Post 2', 'body': 'Body 2'},
        ],
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await postController.fetchPosts();
    await tester.pumpAndSettle();

    expect(postController.posts.length, 2);
    expect(find.text('Post 1'), findsOneWidget);
    expect(find.text('Post 2'), findsOneWidget);
  });

  testWidgets('Displays EmptyMolecule when there is no data', (WidgetTester tester) async {
    when(mockProvider.fetchPosts()).thenAnswer(
      (_) async => const Response(statusCode: 200, body: []),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await postController.fetchPosts();
    await tester.pumpAndSettle();

    expect(find.byType(EmptyMolecule), findsOneWidget);
  });

  testWidgets('Triggers onRefresh from RefreshIndicator', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
    await tester.pumpAndSettle();

    verify(mockProvider.fetchPosts()).called(1);
  });

  testWidgets('Executes onRetry when an error occurs', (WidgetTester tester) async {
    when(mockProvider.fetchPosts()).thenThrow(Exception('Network Error'));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();
    await postController.fetchData(
      () => mockProvider.fetchPosts(),
      (body) => body,
    );
    await tester.pump();

    expect(postController.errorMessage.value, 'Exception: Network Error');
    expect(find.text('Exception: Network Error'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, S().retry));
    await tester.pump();
  });
}
