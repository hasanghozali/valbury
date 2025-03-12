import 'package:flutter_test/flutter_test.dart';
import 'package:app/model/post_model.dart';

void main() {
  group('PostModel', () {
    test('should be initialized with provided values', () {
      final post = PostModel(
        userId: 1,
        id: 101,
        title: 'Sample Post',
        body: 'This is a sample post body.',
      );

      expect(post.userId, 1);
      expect(post.id, 101);
      expect(post.title, 'Sample Post');
      expect(post.body, 'This is a sample post body.');
    });

    test('should have correct default values', () {
      final post = PostModel();

      expect(post.userId, isNull);
      expect(post.id, isNull);
      expect(post.title, isNull);
      expect(post.body, isNull);
    });

    test('should allow updating properties after initialization', () {
      final post = PostModel();

      post.userId = 2;
      post.id = 202;
      post.title = 'Updated Post';
      post.body = 'This is an updated post body.';

      expect(post.userId, 2);
      expect(post.id, 202);
      expect(post.title, 'Updated Post');
      expect(post.body, 'This is an updated post body.');
    });

    test('should correctly create an instance from JSON', () {
      final json = {
        'userId': 3,
        'id': 303,
        'title': 'Test Post',
        'body': 'This is a test post body.',
      };

      final post = PostModel.fromJson(json);

      expect(post.userId, 3);
      expect(post.id, 303);
      expect(post.title, 'Test Post');
      expect(post.body, 'This is a test post body.');
    });
  });
}
