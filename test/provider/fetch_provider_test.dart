import 'package:app/provider/fetch_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late FetchProvider fetchProvider;

  setUp(() {
    fetchProvider = FetchProvider();
  });

  test('fetchPosts should return a Response', () async {
    final response = await fetchProvider.fetchPosts();
    expect(response, isA<Response>());
  });

  test('fetchComments should return a Response', () async {
    final response = await fetchProvider.fetchComments(1);
    expect(response, isA<Response>());
  });

  test('fetchAlbums should return a Response', () async {
    final response = await fetchProvider.fetchAlbums();
    expect(response, isA<Response>());
  });

  test('fetchPhotos should return a Response', () async {
    final response = await fetchProvider.fetchPhotos(1);
    expect(response, isA<Response>());
  });
}
