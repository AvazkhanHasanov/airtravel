import '../../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/base_model.dart';

class BaseRepository {
  final ApiClient _apiClient;

  BaseRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<BaseModel>>> getCityList() async {
    final result = await _apiClient.get<List>('/base/city/list/');
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data.map((e) => BaseModel.fromJson(e)).toList()),
    );
  }

  Future<Result<List<BaseModel>>> getCountryList() async {
    final result = await _apiClient.get<List>('/base/country/list/');
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data.map((e) => BaseModel.fromJson(e)).toList()),
    );
  }

  Future<Result<List<BaseModel>>> getRegionList() async {
    final result = await _apiClient.get<List>('/base/region/list/');
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data.map((e) => BaseModel.fromJson(e)).toList()),
    );
  }
}
