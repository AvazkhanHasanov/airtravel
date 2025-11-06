import '../../../core/client.dart';
import '../../core/utils/result.dart';
import '../model/packages/acc_list_model.dart';
import '../model/packages/acc_retrieve_model.dart';
import '../model/packages/activity_retrieve_model.dart';
import '../model/packages/day_retrieve_model.dart';
import '../model/packages/package_list_model.dart';
import '../model/packages/retrieve_model.dart';

class PackageRepository {
  final ApiClient _apiClient;

  PackageRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<Result<List<PackageListModel>>> getPackages({Map<String, dynamic>? queryParams}) async {
    final result = await _apiClient.get<List>('/packages/package/list/', queryParams: queryParams);
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data.map((e) => PackageListModel.fromJson(e)).toList()),
    );
  }

  Future<Result<List<PackageListModel>>> getLikedPackages() async {
    final result = await _apiClient.get('/packages/package/list/liked/');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(data.map((e) => PackageListModel.fromJson(e)).toList()),
    );
  }

  Future<Result<RetrieveModel>> getPackageById(int id) async {
    final result = await _apiClient.get('/packages/package/retrieve/$id/');
    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(RetrieveModel.fromJson(data)),
    );
  }

  Future<Result<DayRetrieveModel>> getDayById(int id) async {
    final result = await _apiClient.get('/packages/day/retrieve/$id/');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(DayRetrieveModel.fromJson(data)),
    );
  }

  Future<Result<List<AccListModel>>> getAccommodationList() async {
    final result = await _apiClient.get<List>('/packages/accommodation/list/');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok((data).map((e) => AccListModel.fromJson(e)).toList()),
    );
  }

  Future<Result<AccRetrieveModel>> getAccommodationById(int id) async {
    final result = await _apiClient.get('/packages/accommodation/retrieve/$id/');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(AccRetrieveModel.fromJson(data)),
    );
  }

  Future<Result<ActivityRetrieveModel>> getActivityById(int id) async {
    final result = await _apiClient.get('/packages/activity/retrieve/$id/');

    return result.fold(
      (error) => Result.error(error),
      (data) => Result.ok(ActivityRetrieveModel.fromJson(data)),
    );
  }
}
