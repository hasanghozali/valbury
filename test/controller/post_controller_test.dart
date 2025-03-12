import 'package:app/controller/post_controller.dart';
import 'package:app/model/post_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart';
import 'fetch_controller_test.dart';

void main() {
  group('PostController Tests', () {
    late PostController postController;
    late MockFetchProvider mockProvider;

    setUp(() {
      mockProvider = MockFetchProvider();
      postController = PostController(provider: mockProvider);
    });

    test('fetchPosts should update post list', () async {
      final mockPosts = [
        {'userId': 1, 'id': 1, 'title': 'Post 1', 'body': 'Body 1'},
        {'userId': 1, 'id': 2, 'title': 'Post 2', 'body': 'Body 2'},
      ];

      when(mockProvider.fetchPosts()).thenAnswer(
        (_) async => Response(statusCode: 200, body: mockPosts),
      );

      await postController.fetchPosts();

      expect(postController.posts.length, 2);
      expect(postController.posts[0].title, 'Post 1');
    });

    test('addFavorite should move post between lists', () {
      final post = PostModel(userId: 1, id: 1, title: 'Post 1', body: 'Body 1');
      postController.postNotFavorites.add(post);

      postController.addFavorite(1);
      expect(postController.postFavorites.contains(post), true);
      expect(postController.postNotFavorites.contains(post), false);

      postController.addFavorite(1);
      expect(postController.postFavorites.contains(post), false);
      expect(postController.postNotFavorites.contains(post), true);
    });
  });
}
