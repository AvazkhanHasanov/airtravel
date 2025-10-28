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
      baseUrl: "http://192.168.9.198:8000/api/v1",

      validateStatus: (status) => true,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('Request Ketti $options, $handler');
    var token = await secureStorage.read(key: 'token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint('Response keldii: $response, $handler,');
    if (response.statusCode == 401) {
      var login = await secureStorage.read(key: 'login');
      var password = await secureStorage.read(key: 'password');
      if (login == null || password == null) await logout();

      var result = await dio.post('/auth/login', data: {'login': login, 'password': password});
      String? token = result.data['accessToken'];

      if (result.statusCode != 200 || token == null) await logout();

      await secureStorage.write(key: 'token', value: token);
      final headers = response.requestOptions.headers;
      headers['Authorization'] = 'Bearer $token';

      var retry = await dio.fetch(
        RequestOptions(
          baseUrl: response.requestOptions.baseUrl,
          path: response.requestOptions.path,
          method: response.requestOptions.method,
          headers: headers,
        ),
      );
      return super.onResponse(retry, handler);
    } else {
      return super.onResponse(response, handler);
    }
  }

  Future<void> logout() async {
    await secureStorage.delete(key: 'token');
    await secureStorage.delete(key: 'login');
    await secureStorage.delete(key: 'password');
    router.go(Routes.login);
    return;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('errooooooooooooooooor: $err, $handler');
    super.onError(err, handler);
  }
}
