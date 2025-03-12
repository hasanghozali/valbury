import 'package:app/controller/comment_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';

import 'fetch_controller_test.dart';

void main() {
  group('CommentController Tests', () {
    late CommentController commentController;
    late MockFetchProvider mockProvider;

    setUp(() {
      mockProvider = MockFetchProvider();
      commentController = CommentController(provider: mockProvider);
    });

    test('fetchComments should update comments list', () async {
      final mockComments = [
        {'postId': 1, 'id': 1, 'name': 'Comment 1', 'email': 'email1@email.com', 'body': 'Body 1'},
        {'postId': 1, 'id': 2, 'name': 'Comment 2', 'email': 'email2@email.com', 'body': 'Body 2'},
      ];

      when(mockProvider.fetchComments(1)).thenAnswer(
        (_) async => Response(statusCode: 200, body: mockComments),
      );

      await commentController.fetchComments(1);

      expect(commentController.comments.length, 2);
      expect(commentController.comments[0].name, 'Comment 1');
    });
  });
}
