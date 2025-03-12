import 'package:app/model/comment_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommentModel', () {
    test('should be initialized with provided values', () {
      final comment = CommentModel(
        postId: 1,
        id: 101,
        name: 'John Doe',
        email: 'johndoe@example.com',
        body: 'This is a sample comment.',
      );

      expect(comment.postId, 1);
      expect(comment.id, 101);
      expect(comment.name, 'John Doe');
      expect(comment.email, 'johndoe@example.com');
      expect(comment.body, 'This is a sample comment.');
    });

    test('should have correct default values', () {
      final comment = CommentModel();

      expect(comment.postId, isNull);
      expect(comment.id, isNull);
      expect(comment.name, isNull);
      expect(comment.email, isNull);
      expect(comment.body, isNull);
    });

    test('should allow updating properties after initialization', () {
      final comment = CommentModel();

      comment.postId = 2;
      comment.id = 202;
      comment.name = 'Jane Doe';
      comment.email = 'janedoe@example.com';
      comment.body = 'Updated comment body.';

      expect(comment.postId, 2);
      expect(comment.id, 202);
      expect(comment.name, 'Jane Doe');
      expect(comment.email, 'janedoe@example.com');
      expect(comment.body, 'Updated comment body.');
    });

    test('should correctly create an instance from JSON', () {
      final json = {
        'postId': 3,
        'id': 303,
        'name': 'Alice',
        'email': 'alice@example.com',
        'body': 'This is a test comment.',
      };

      final comment = CommentModel.fromJson(json);

      expect(comment.postId, 3);
      expect(comment.id, 303);
      expect(comment.name, 'Alice');
      expect(comment.email, 'alice@example.com');
      expect(comment.body, 'This is a test comment.');
    });
  });
}
