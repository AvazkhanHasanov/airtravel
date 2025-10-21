import 'package:dio/dio.dart';

import 'auth_interceptor.dart';
import 'utils/result.dart';

class ApiClient {
  final AuthInterceptor interceptor;

  ApiClient({required this.interceptor}) {
    _dio = Dio(
      BaseOptions(baseUrl: "http://127.0.0.1:8000/api/v1", validateStatus: (status) => true),
    )..interceptors.add(interceptor);
  }

  late final Dio _dio;

  Future<Result<T>> get<T>(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      var response = await _dio.get(path, queryParameters: queryParams);

      if (response.statusCode != 200) {
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data as T);
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result<T>> post<T>(String path, {required Map<String, dynamic> data}) async {
    try {
      var response = await _dio.post(path, data: data);

      if (response.statusCode != 200 && response.statusCode != 201) {
        return Result.error(Exception('hatolik ${response.data}'));
      }
      return Result.ok(response.data as T);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<T>> patch<T>(String path, {required Map<String, dynamic> data}) async {
    try {
      var response = await _dio.patch(path, data: data);
      if (response.statusCode != 200) {
        return Result.error(response.data);
      }
      return Result.ok(response.data as T);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> delete(String path) async {
    try {
      var response = await _dio.delete(path);
      if (response.statusCode != 204) {
        return Result.error(response.data);
      }
      return Result.ok(response.data);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
