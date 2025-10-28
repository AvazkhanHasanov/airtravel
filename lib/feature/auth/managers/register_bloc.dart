import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:air_travel/data/repository/login_repository.dart';
import 'package:air_travel/data/model/register_model.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final LoginRepository repository;

  RegisterBloc({required this.repository}) : super(const RegisterState()) {
    on<SubmitRegisterEvent>(_onSubmitRegister);
  }

  Future<void> _onSubmitRegister(
      SubmitRegisterEvent event,
      Emitter<RegisterState> emit,
      ) async {
    print("Register Bloc: SubmitRegisterEvent boshlandi");
    emit(state.copyWith(status: RegisterStatus.loading));

    final result = await repository.register(
      RegisterModel(
        firstName: event.firstName,
        lastName: event.lastName,
        phoneNumber: event.phoneNumber,
        region: event.region,
        profilePhoto: event.profilePhoto,
      ),
    );

    result.fold(
          (error) {
        print(" Register Bloc: Xatolik - $error");
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            errorMessage: error.toString(),
          ),
        );
      },
          (data) {
        print("Register Bloc: Muvaffaqiyatli ro'yxatdan o'tdi");
        emit(state.copyWith(status: RegisterStatus.success));
      },
    );
  }
}