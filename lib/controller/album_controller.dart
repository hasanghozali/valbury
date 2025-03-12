import 'package:app/controller/fetch_controller.dart';
import 'package:app/model/album_model.dart';
import 'package:app/provider/fetch_provider.dart';
import 'package:get/get.dart';

class AlbumController extends FetchController {
  final FetchProvider provider;
  AlbumController({FetchProvider? provider}) : provider = provider ?? FetchProvider();

  var albums = <AlbumModel>[].obs;
  var albumNotFavorites = <AlbumModel>[].obs;
  var albumFavorites = <AlbumModel>[].obs;

  Future<void> fetchAlbums() async {
    albums.clear();
    albumNotFavorites.clear();
    final result = await fetchData(
      provider.fetchAlbums,
      (data) => (data as List).map((item) => AlbumModel.fromJson(item)).toList(),
    );
    albumNotFavorites.value = result ?? [];
    _reorderFavorite();
  }

  void _reorderFavorite() {
    albums.clear();
    albumNotFavorites.removeWhere((e) => albumFavorites.any((f) => f.id == e.id));
    albums.addAll(albumFavorites);
    albums.addAll(albumNotFavorites);
  }

  void addFavorite(int id) {
    final notFavorite = albumFavorites.firstWhereOrNull((e) => e.id == id);
    if (notFavorite != null) {
      albumFavorites.removeWhere((e) => e.id == id);
      albumNotFavorites.insert(0, notFavorite);
    } else {
      final favorite = albumNotFavorites.firstWhereOrNull((e) => e.id == id);
      albumNotFavorites.removeWhere((e) => e.id == id);
      albumFavorites.insert(0, favorite!);
    }
    _reorderFavorite();
  }
}
