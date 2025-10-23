
import 'package:air_travel/core/client.dart';
import 'package:air_travel/core/utils/result.dart';
import 'package:air_travel/data/model/gallery_model.dart';

class GalleryRepository {
  final ApiClient _client;

  GalleryRepository({required ApiClient client}) : _client = client;

  Future<Result<List<GalleryModel>>> getAll() async {
    final response = await _client.get<List>('/gallery/main_page_picture/list/');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => GalleryModel.fromJson(x)).toList()),
    );
  }
}
