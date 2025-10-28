import 'package:dio/dio.dart';

import 'auth_interceptor.dart';
import 'utils/result.dart';

class ApiClient {
  final AuthInterceptor interceptor;

  ApiClient({required this.interceptor}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://194.187.122.4:8000/uz/api/v1",
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        validateStatus: (status) => true,
        followRedirects: false,
      ),
    )..interceptors.add(interceptor);
  }

  late final Dio _dio;

  Future<Result<T>> get<T>(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      var response = await _dio.get(path, queryParameters: queryParams);

      if (response.statusCode != 200) {
        print("GET Error: ${response.statusCode} -> ${response.data}");
        return Result.error(Exception(response.data));
      }

      print("GET Success: ${response.statusCode} -> ${response.data}");
      return Result.ok(response.data as T);
    } on DioException catch (e) {
      print("DioException GET: ${e.message}");
      print("DioException Type: ${e.type}");
      print("DioException Response: ${e.response?.data}");
      return Result.error(e);
    } on Exception catch (exception) {
      print("Exception GET: ${exception.toString()}");
      return Result.error(exception);
    }
  }
  Future<Result<T>> post<T>(String path, {required Map<String, dynamic> data}) async {
    try {
      print(" POST request yuborilmoqda: $path");
      print(" Data: $data");

      var response = await _dio.post(path, data: data);

      print(" POST Response keldi: ${response.statusCode}");
      print("POST Response: ${response.statusCode} -> ${response.data}");

      if (response.statusCode != 200 && response.statusCode != 201) {
        print("POST Error: ${response.statusCode} -> ${response.data}");
        return Result.error(Exception('Xatolik: ${response.data}'));
      }
      return Result.ok(response.data as T);
    } on DioException catch (e) {
      print("DioException POST: ${e.message}");
      print("DioException Type: ${e.type}");
      print("DioException Response: ${e.response?.data}");
      print("DioException StatusCode: ${e.response?.statusCode}");
      return Result.error(e);
    } on Exception catch (e) {
      print(" Exception POST: ${e.toString()}");
      return Result.error(e);
    }
  }

  Future<Result<T>> patch<T>(String path, {required Map<String, dynamic> data}) async {
    try {
      var response = await _dio.patch(path, data: data);

      print("PATCH Response: ${response.statusCode} -> ${response.data}");

      if (response.statusCode != 200) {
        print("PATCH Error: ${response.statusCode} -> ${response.data}");
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data as T);
    } on DioException catch (e) {
      print("DioException PATCH: ${e.message}");
      print("DioException Response: ${e.response?.data}");
      return Result.error(e);
    } on Exception catch (e) {
      print("Exception PATCH: ${e.toString()}");
      return Result.error(e);
    }
  }

  Future<Result> delete(String path) async {
    try {
      var response = await _dio.delete(path);

      print("DELETE Response: ${response.statusCode} -> ${response.data}");

      if (response.statusCode != 204) {
        print("DELETE Error: ${response.statusCode} -> ${response.data}");
        return Result.error(Exception(response.data));
      }
      return Result.ok(response.data);
    } on DioException catch (e) {
      print("DioException DELETE: ${e.message}");
      print("DioException Response: ${e.response?.data}");
      return Result.error(e);
    } on Exception catch (e) {
      print("Exception DELETE: ${e.toString()}");
      return Result.error(e);
    }
  }
}