import 'package:app/model/album_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AlbumModel', () {
    test('should be initialized with provided values', () {
      final album = AlbumModel(
        userId: 1,
        id: 101,
        title: 'Sample Album',
      );

      expect(album.userId, 1);
      expect(album.id, 101);
      expect(album.title, 'Sample Album');
    });

    test('should have correct default values', () {
      final album = AlbumModel();

      expect(album.userId, isNull);
      expect(album.id, isNull);
      expect(album.title, isNull);
    });

    test('should allow updating properties after initialization', () {
      final album = AlbumModel();

      album.userId = 2;
      album.id = 202;
      album.title = 'Updated Album';

      expect(album.userId, 2);
      expect(album.id, 202);
      expect(album.title, 'Updated Album');
    });

    test('should correctly create an instance from JSON', () {
      final json = {
        'userId': 3,
        'id': 303,
        'title': 'Test Album',
      };

      final album = AlbumModel.fromJson(json);

      expect(album.userId, 3);
      expect(album.id, 303);
      expect(album.title, 'Test Album');
    });
  });
}
