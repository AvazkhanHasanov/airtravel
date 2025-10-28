import 'package:air_travel/data/model/login_model.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final LoginModel? data;
  final String? errorMessage;

  const LoginState({
    this.status = LoginStatus.initial,
    this.data,
    this.errorMessage,
  });

  LoginState copyWith({
    LoginStatus? status,
    LoginModel? data,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage];
}
