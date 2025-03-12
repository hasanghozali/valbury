import 'package:app/controller/album_controller.dart';
import 'package:app/controller/fetch_controller.dart';
import 'package:app/provider/fetch_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mockito/mockito.dart';

class MockFetchProvider extends Mock implements FetchProvider {
  Future<Response<dynamic>> fetch() => super.noSuchMethod(
        Invocation.method(#fetch, []),
        returnValue: Future.value(const Response(statusCode: 200, body: [])),
        returnValueForMissingStub: Future.value(const Response(statusCode: 200, body: [])),
      );

  @override
  Future<Response<dynamic>> fetchAlbums() => fetch();

  @override
  Future<Response<dynamic>> fetchPosts() => fetch();

  @override
  Future<Response<dynamic>> fetchComments(int id) => fetch();

  @override
  Future<Response<dynamic>> fetchPhotos(int id) => fetch();
}

void main() {
  late FetchController controller;
  late MockFetchProvider mockProvider;

  setUp(() {
    mockProvider = MockFetchProvider();
    controller = AlbumController();
  });

  test('fetchData should return parsed data when response is successful', () async {
    when(mockProvider.fetchAlbums()).thenAnswer(
      (_) async => const Response(statusCode: 200, body: ['data']),
    );

    final result = await controller.fetchData(
      mockProvider.fetchAlbums,
      (body) => body,
    );

    expect(result, ['data']);
    expect(controller.errorMessage.value, isNull);
    expect(controller.isLoading.value, false);
  });

  test('fetchData should set error when response is not OK', () async {
    when(mockProvider.fetchAlbums()).thenThrow(Exception('Network Error'));

    await controller.fetchData(
      () => mockProvider.fetchAlbums(),
      (body) => body,
    );

    expect(controller.errorMessage.value, 'Exception: Network Error');
  });

  test('fetchData should catch and set error on exception', () async {
    when(mockProvider.fetchAlbums()).thenThrow(Exception('Network Error'));

    final result = await controller.fetchData(
      mockProvider.fetchAlbums,
      (body) => body,
    );

    expect(result, isNull);
    expect(controller.errorMessage.value, 'Exception: Network Error');
    expect(controller.isLoading.value, false);
  });

  test('fetchData should always set isLoading to false', () async {
    when(mockProvider.fetchAlbums()).thenAnswer(
      (_) async => const Response(statusCode: 200, body: ['data']),
    );

    await controller.fetchData(mockProvider.fetchAlbums, (body) => body);
    expect(controller.isLoading.value, false);

    when(mockProvider.fetchAlbums()).thenThrow(Exception('Network Error'));

    await controller.fetchData(mockProvider.fetchAlbums, (body) => body);
    expect(controller.isLoading.value, false);
  });
}
