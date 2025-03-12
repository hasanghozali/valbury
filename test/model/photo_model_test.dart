import 'package:flutter_test/flutter_test.dart';
import 'package:app/model/photo_model.dart';

void main() {
  group('PhotoModel', () {
    test('should be initialized with provided values', () {
      final photo = PhotoModel(
        albumId: 1,
        id: 101,
        title: 'Sample Photo',
        url: 'https://example.com/photo.jpg',
        thumbnailUrl: 'https://example.com/thumb.jpg',
      );

      expect(photo.albumId, 1);
      expect(photo.id, 101);
      expect(photo.title, 'Sample Photo');
      expect(photo.url, 'https://example.com/photo.jpg');
      expect(photo.thumbnailUrl, 'https://example.com/thumb.jpg');
    });

    test('should have correct default values', () {
      final photo = PhotoModel();

      expect(photo.albumId, isNull);
      expect(photo.id, isNull);
      expect(photo.title, isNull);
      expect(photo.url, isNull);
      expect(photo.thumbnailUrl, isNull);
    });

    test('should allow updating properties after initialization', () {
      final photo = PhotoModel();

      photo.albumId = 2;
      photo.id = 202;
      photo.title = 'Updated Photo';
      photo.url = 'https://example.com/updated_photo.jpg';
      photo.thumbnailUrl = 'https://example.com/updated_thumb.jpg';

      expect(photo.albumId, 2);
      expect(photo.id, 202);
      expect(photo.title, 'Updated Photo');
      expect(photo.url, 'https://example.com/updated_photo.jpg');
      expect(photo.thumbnailUrl, 'https://example.com/updated_thumb.jpg');
    });

    test('should correctly create an instance from JSON', () {
      final json = {
        'albumId': 3,
        'id': 303,
        'title': 'Test Photo',
        'url': 'https://example.com/test_photo.jpg',
        'thumbnailUrl': 'https://example.com/test_thumb.jpg',
      };

      final photo = PhotoModel.fromJson(json);

      expect(photo.albumId, 3);
      expect(photo.id, 303);
      expect(photo.title, 'Test Photo');
      expect(photo.url, 'https://example.com/test_photo.jpg');
      expect(photo.thumbnailUrl, 'https://example.com/test_thumb.jpg');
    });
  });
}
