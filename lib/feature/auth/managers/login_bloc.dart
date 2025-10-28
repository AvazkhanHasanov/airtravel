import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:air_travel/data/repository/login_repository.dart';
import 'package:air_travel/data/model/login_model.dart';
import 'login-state.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;

  LoginBloc({required this.repository}) : super(const LoginState()) {
    on<SendPhoneNumberEvent>(_onSendPhoneNumber);
  }

  Future<void> _onSendPhoneNumber(
      SendPhoneNumberEvent event,
      Emitter<LoginState> emit,
      ) async {
    print("Bloc: SendPhoneNumberEvent boshlandi - ${event.phoneNumber}");
    emit(state.copyWith(status: LoginStatus.loading));

    final result = await repository.sendPhoneNumber(
      LoginModel(phoneNumber: event.phoneNumber),
    );

    result.fold(
          (error) {
        print("Bloc: Xatolik - $error");
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            errorMessage: error.toString(),
          ),
        );
      },
          (data) {
        print("Bloc: Muvaffaqiyatli - ${data.phoneNumber}");
        emit(
          state.copyWith(
            status: LoginStatus.success,
            data: data,
          ),
        );
      },
    );
  }
}