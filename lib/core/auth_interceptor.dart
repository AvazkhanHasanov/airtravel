import 'package:air_travel/core/routing/router.dart';
import 'routing/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.secureStorage,
  });

  final FlutterSecureStorage secureStorage;
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://194.187.122.4:8000/uz/api/v1",
      validateStatus: (status) => true,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('📤 Request: ${options.method} ${options.path}');
    debugPrint('🌐 FULL URL: ${options.uri.toString()}');
    debugPrint('📦 BaseURL: ${options.baseUrl}');
    debugPrint('📂 Path: ${options.path}');
    debugPrint('📤 Data: ${options.data}');
    debugPrint('📤 Headers: ${options.headers}');

    var token = await secureStorage.read(key: 'token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      debugPrint('Token qo\'shildi');
    } else {
      debugPrint('Token topilmadi');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint('Response: ${response.statusCode} ${response.requestOptions.path}');
    debugPrint('Data: ${response.data}');

    if (response.statusCode == 401) {
      debugPrint('401 Error - Token yangilanmoqda...');

      var login = await secureStorage.read(key: 'login');
      var password = await secureStorage.read(key: 'password');

      if (login == null || password == null) {
        debugPrint(' Login yoki password topilmadi, logout qilinmoqda');
        await logout();
        return super.onResponse(response, handler);
      }

      try {
        var result = await dio.post('/auth/login', data: {'login': login, 'password': password});
        String? token = result.data['accessToken'];

        if (result.statusCode != 200 || token == null) {
          debugPrint(' Token yangilash muvaffaqiyatsiz, logout qilinmoqda');
          await logout();
          return super.onResponse(response, handler);
        }

        await secureStorage.write(key: 'token', value: token);
        debugPrint(' Token yangilandi');

        final headers = response.requestOptions.headers;
        headers['Authorization'] = 'Bearer $token';

        var retry = await dio.fetch(
          RequestOptions(
            baseUrl: response.requestOptions.baseUrl,
            path: response.requestOptions.path,
            method: response.requestOptions.method,
            headers: headers,
            data: response.requestOptions.data,
            queryParameters: response.requestOptions.queryParameters,
          ),
        );

        debugPrint(' So\'rov qayta yuborildi');
        return super.onResponse(retry, handler);
      } catch (e) {
        debugPrint(' Token yangilashda xatolik: $e');
        await logout();
        return super.onResponse(response, handler);
      }
    } else {
      return super.onResponse(response, handler);
    }
  }

  Future<void> logout() async {
    debugPrint('🚪 Logout...');
    await secureStorage.delete(key: 'token');
    await secureStorage.delete(key: 'login');
    await secureStorage.delete(key: 'password');
    router.go(Routes.login);
    return;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(' Error: ${err.message}');
    debugPrint(' Error Type: ${err.type}');
    debugPrint(' Response: ${err.response?.data}');
    debugPrint(' Status Code: ${err.response?.statusCode}');

    if (err.type == DioExceptionType.connectionTimeout) {
      debugPrint(' Connection Timeout - Backend javob bermadi');
    } else if (err.type == DioExceptionType.receiveTimeout) {
      debugPrint(' Receive Timeout - Ma\'lumot olishda timeout');
    } else if (err.type == DioExceptionType.connectionError) {
      debugPrint(' Connection Error - Internet yoki backend bilan bog\'lanish muammosi');
    }

    super.onError(err, handler);
  }
}