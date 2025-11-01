// feature/auth/managers/otp_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:air_travel/data/repository/login_repository.dart';
import 'otp_event.dart';
import 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final LoginRepository repository;

  OtpBloc({required this.repository}) : super(const OtpState()) {
    on<VerifyOtpEvent>(_onVerifyOtp);
  }

  Future<void> _onVerifyOtp(
      VerifyOtpEvent event,
      Emitter<OtpState> emit,
      ) async {
    print(" OTP Bloc: VerifyOtpEvent boshlandi - ${event.phoneNumber}");
    emit(state.copyWith(status: OtpStatus.loading));

    final result = await repository.verifyOtp(
      OtpModel(phoneNumber: event.phoneNumber, code: event.code),
    );

    result.fold(
          (error) {
        print(" OTP Bloc: Xatolik - $error");
        emit(
          state.copyWith(
            status: OtpStatus.failure,
            errorMessage: error.toString(),
          ),
        );
      },
          (data) {
        print(" OTP Bloc: Muvaffaqiyatli - Token olindi");
        emit(state.copyWith(status: OtpStatus.success));
      },
    );
  }
}