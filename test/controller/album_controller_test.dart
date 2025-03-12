import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';
import 'package:app/controller/album_controller.dart';
import 'package:app/model/album_model.dart';

import 'fetch_controller_test.dart';

void main() {
  group('AlbumController Tests', () {
    late AlbumController albumController;
    late MockFetchProvider mockProvider;

    setUp(() {
      mockProvider = MockFetchProvider();
      albumController = AlbumController(provider: mockProvider);
    });

    test('fetchAlbums should update albums list', () async {
      final mockAlbums = [
        {'userId': 1, 'id': 1, 'title': 'Album 1'},
        {'userId': 1, 'id': 2, 'title': 'Album 2'},
      ];

      when(mockProvider.fetchAlbums()).thenAnswer(
        (_) async => Response(statusCode: 200, body: mockAlbums),
      );

      await albumController.fetchAlbums();

      expect(albumController.albums.length, 2);
      expect(albumController.albums[0].title, 'Album 1');
    });

    test('addFavorite should move album between lists', () {
      final album = AlbumModel(userId: 1, id: 1, title: 'Album 1');
      albumController.albumNotFavorites.add(album);

      albumController.addFavorite(1);
      expect(albumController.albumFavorites.contains(album), true);
      expect(albumController.albumNotFavorites.contains(album), false);

      albumController.addFavorite(1);
      expect(albumController.albumFavorites.contains(album), false);
      expect(albumController.albumNotFavorites.contains(album), true);
    });
  });
}
