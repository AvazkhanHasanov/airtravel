import 'package:air_travel/core/client.dart';
import 'package:air_travel/core/utils/result.dart';
import 'package:air_travel/data/model/popular_model.dart';

class PopularRepository {
  final ApiClient _client;

  PopularRepository({required ApiClient client}) : _client = client;

  Future<Result<List<PopularModel>>> getAll() async {
    final response = await _client.get<List>('/places/popular_place/list/');
    return response.fold(
      (error) => Result.error(error),
      (value) => Result.ok(value.map((x) => PopularModel.fromJson(x)).toList()),
    );
  }
}
