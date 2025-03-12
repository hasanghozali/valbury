import 'package:app/controller/fetch_controller.dart';
import 'package:app/model/photo_model.dart';
import 'package:app/provider/fetch_provider.dart';
import 'package:get/get.dart';

class PhotoController extends FetchController {
  final FetchProvider provider;
  PhotoController({FetchProvider? provider}) : provider = provider ?? FetchProvider();

  var photos = <PhotoModel>[].obs;

  Future<void> fetchPhotos(int id) async {
    photos.clear();
    final result = await fetchData(
      () => provider.fetchPhotos(id),
      (data) => (data as List).map((item) => PhotoModel.fromJson(item)).toList(),
    );
    photos.value = result ?? [];
  }
}
