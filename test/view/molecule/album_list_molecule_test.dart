import 'package:app/const/value_const.dart';
import 'package:app/controller/album_controller.dart';
import 'package:app/controller/connection_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/molecule/album_list_molecule.dart';
import 'package:app/view/molecule/empty_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';

import '../../controller/fetch_controller_test.dart';

void main() {
  late AlbumController albumController;
  late MockFetchProvider mockProvider;

  setUp(() {
    mockProvider = MockFetchProvider();
    albumController = AlbumController(provider: mockProvider);
    Get.put<AlbumController>(albumController);
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
          body: AlbumListMolecule(withTitle: true),
        ),
      ),
    );
  }

  testWidgets('AlbumListMolecule displays the album list correctly', (WidgetTester tester) async {
    when(mockProvider.fetchAlbums()).thenAnswer(
      (_) async => const Response(
        statusCode: 200,
        body: [
          {'userId': 1, 'id': 1, 'title': 'Album 1'},
          {'userId': 1, 'id': 2, 'title': 'Album 2'},
        ],
      ),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await albumController.fetchAlbums();
    await tester.pumpAndSettle();

    expect(albumController.albums.length, 2);
    expect(find.text('Album 1'), findsOneWidget);
    expect(find.text('Album 2'), findsOneWidget);
  });

  testWidgets('Displays EmptyMolecule when there is no data', (WidgetTester tester) async {
    when(mockProvider.fetchAlbums()).thenAnswer(
      (_) async => const Response(statusCode: 200, body: []),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await albumController.fetchAlbums();
    await tester.pumpAndSettle();

    expect(find.byType(EmptyMolecule), findsOneWidget);
  });

  testWidgets('Triggers onRefresh from RefreshIndicator', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
    await tester.pumpAndSettle();

    verify(mockProvider.fetchAlbums()).called(1);
  });

  testWidgets('Executes onRetry when an error occurs', (WidgetTester tester) async {
    when(mockProvider.fetchAlbums()).thenThrow(Exception('Network Error'));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();
    await albumController.fetchData(
      () => mockProvider.fetchAlbums(),
      (body) => body,
    );
    await tester.pump();

    expect(albumController.errorMessage.value, 'Exception: Network Error');
    expect(find.text('Exception: Network Error'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, S().retry));
    await tester.pump();
  });
}
