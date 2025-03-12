import 'package:app/controller/fetch_controller.dart';
import 'package:app/model/post_model.dart';
import 'package:app/provider/fetch_provider.dart';
import 'package:get/get.dart';

class PostController extends FetchController {
  final FetchProvider provider;
  PostController({FetchProvider? provider}) : provider = provider ?? FetchProvider();

  var posts = <PostModel>[].obs;
  var postNotFavorites = <PostModel>[].obs;
  var postFavorites = <PostModel>[].obs;

  Future<void> fetchPosts() async {
    posts.clear();
    postNotFavorites.clear();
    final result = await fetchData(
      provider.fetchPosts,
      (data) => (data as List).map((item) => PostModel.fromJson(item)).toList(),
    );
    postNotFavorites.value = result ?? [];
    _reorderFavorite();
  }

  void _reorderFavorite() {
    posts.clear();
    postNotFavorites.removeWhere((e) => postFavorites.any((f) => f.id == e.id));
    posts.addAll(postFavorites);
    posts.addAll(postNotFavorites);
  }

  void addFavorite(int id) {
    final notFavorite = postFavorites.firstWhereOrNull((e) => e.id == id);
    if (notFavorite != null) {
      postFavorites.removeWhere((e) => e.id == id);
      postNotFavorites.insert(0, notFavorite);
    } else {
      final favorite = postNotFavorites.firstWhereOrNull((e) => e.id == id);
      postNotFavorites.removeWhere((e) => e.id == id);
      postFavorites.insert(0, favorite!);
    }
    _reorderFavorite();
  }
}
