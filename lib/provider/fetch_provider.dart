import 'package:app/const/value_const.dart';
import 'package:get/get.dart';

class FetchProvider extends GetConnect {
  final String url = ValueConst.baseUrl;

  FetchProvider() {
    httpClient.baseUrl = url;
  }

  Future<Response> fetchPosts() => get('/posts');

  Future<Response> fetchComments(int postId) => get('/posts/$postId/comments');

  Future<Response> fetchAlbums() => get('/albums');

  Future<Response> fetchPhotos(int albumId) => get('/albums/$albumId/photos');
}
