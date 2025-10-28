import 'package:air_travel/core/client.dart';
import 'package:air_travel/core/utils/result.dart';
import 'package:air_travel/data/model/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OtpModel {
  final String phoneNumber;
  final String code;

  OtpModel({required this.phoneNumber, required this.code});

  Map<String, dynamic> toJson() => {
    'phone_number': phoneNumber,
    'code': code,
  };
}

class OtpResponseModel {
  final String accessToken;
  final String refreshToken;

  OtpResponseModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      accessToken: json['access'] ?? json['accessToken'] ?? '',
      refreshToken: json['refresh'] ?? json['refreshToken'] ?? '',
    );
  }
}

class LoginRepository {
  final ApiClient _client;
  final FlutterSecureStorage _storage;

  LoginRepository({
    required ApiClient client,
    required FlutterSecureStorage storage,
  })  : _client = client,
        _storage = storage;

  Future<Result<LoginModel>> sendPhoneNumber(LoginModel model) async {
    try {
      print(" Repository: Telefon raqami yuborilmoqda - ${model.phoneNumber}");

      final response = await _client.post<Map<String, dynamic>>(
        '/accounts/user/check/',
        data: model.toJson(),
      );

      return response.fold(
            (error) {
          print(" Repository Error: $error");
          return Result.error(error);
        },
            (value) {
          print("Repository Success: $value");
          return Result.ok(LoginModel.fromJson(value));
        },
      );
    } catch (e) {
      print(" Repository Exception: $e");
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<OtpResponseModel>> verifyOtp(OtpModel model) async {
    try {
      print(" Repository: OTP tekshirilmoqda - ${model.phoneNumber}");

      final response = await _client.post<Map<String, dynamic>>(
        '/accounts/user/token/',
        data: model.toJson(),
      );

      return response.fold(
            (error) {
          print(" OTP Repository Error: $error");
          return Result.error(error);
        },
            (value) async {
          print("OTP Repository Success: $value");

          final otpResponse = OtpResponseModel.fromJson(value);

          // Token ni saqlash
          await _storage.write(key: 'token', value: otpResponse.accessToken);
          await _storage.write(key: 'refresh_token', value: otpResponse.refreshToken);
          await _storage.write(key: 'login', value: model.phoneNumber);

          print(" Token saqlandi");

          return Result.ok(otpResponse);
        },
      );
    } catch (e) {
      print(" OTP Repository Exception: $e");
      return Result.error(Exception(e.toString()));
    }
  }
}