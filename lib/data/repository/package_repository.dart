import '../../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/packages/accommodation_list_model.dart';
import '../model/packages/accommodation_retrieve_model.dart';
import '../model/packages/activity_retrieve.dart';
import '../model/packages/day_retrieve.dart';
import '../model/packages/package_list.dart';
import '../model/packages/package_retrieve.dart';

class ApiRepository {
  final ApiClient _apiClient;

  ApiRepository(this._apiClient);

  Future<Result<List<PackageList>>> getPackages({Map<String, dynamic>? queryParams}) async {
    final result = await _apiClient.get<List>('/packages/package/list/', queryParams: queryParams);
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data.map((e) => PackageList.fromJson(e)).toList()),
    );
  }

  Future<Result<List<PackageList>>> getLikedPackages() async {
    final result = await _apiClient.get('/packages/package/list/liked/');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data.map((e) => PackageList.fromJson(e)).toList()),
    );
  }

  Future<Result<PackageRetrieve>> getPackageById(int id) async {
    final result = await _apiClient.get('/packages/package/retrieve/$id');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(PackageRetrieve.fromJson(data)),
    );
  }

  Future<Result<DayRetrieve>> getDayById(int id) async {
    final result = await _apiClient.get('/packages/day/retrieve/$id');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(DayRetrieve.fromJson(data)),
    );
  }

  Future<Result<List<AccommodationList>>> getAccommodationList() async {
    final result = await _apiClient.get<List>('/packages/accommodation/list/');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok((data).map((e) => AccommodationList.fromJson(e)).toList()),
    );
  }

  Future<Result<AccommodationRetrieve>> getAccommodationById(int id) async {
    final result = await _apiClient.get('/packages/accommodation/retrieve/$id');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(AccommodationRetrieve.fromJson(data)),
    );
  }

  Future<Result<ActivityRetrieve>> getActivityById(int id) async {
    final result = await _apiClient.get('/packages/activity/retrieve/$id');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(ActivityRetrieve.fromJson(data)),
    );
  }
}
