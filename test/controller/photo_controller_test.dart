import 'package:app/controller/photo_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';

import 'fetch_controller_test.dart';

void main() {
  group('PhotoController Tests', () {
    late PhotoController photoController;
    late MockFetchProvider mockProvider;

    setUp(() {
      mockProvider = MockFetchProvider();
      photoController = PhotoController(provider: mockProvider);
    });

    test('fetchPhotos should update photos list', () async {
      final mockPhotos = [
        {'albumId': 1, 'id': 1, 'title': 'Photo 1', 'url': 'dummy_url1', 'thumbnailUrl': 'dummy_url1'},
        {'albumId': 1, 'id': 1, 'title': 'Photo 2', 'url': 'dummy_url2', 'thumbnailUrl': 'dummy_url2'},
      ];

      when(mockProvider.fetchPhotos(1)).thenAnswer(
        (_) async => Response(statusCode: 200, body: mockPhotos),
      );

      await photoController.fetchPhotos(1);

      expect(photoController.photos.length, 2);
      expect(photoController.photos[0].title, 'Photo 1');
    });
  });
}
