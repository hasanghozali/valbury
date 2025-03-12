import 'package:app/controller/fetch_controller.dart';
import 'package:app/model/comment_model.dart';
import 'package:app/provider/fetch_provider.dart';
import 'package:get/get.dart';

class CommentController extends FetchController {
  final FetchProvider provider;
  CommentController({FetchProvider? provider}) : provider = provider ?? FetchProvider();

  var comments = <CommentModel>[].obs;

  Future<void> fetchComments(int id) async {
    comments.clear();
    final result = await fetchData(
      () => provider.fetchComments(id),
      (data) => (data as List).map((item) => CommentModel.fromJson(item)).toList(),
    );
    comments.value = result ?? [];
  }
}
