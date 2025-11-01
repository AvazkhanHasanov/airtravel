// feature/auth/managers/otp_event.dart
import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class VerifyOtpEvent extends OtpEvent {
  final String phoneNumber;
  final String code;

  const VerifyOtpEvent(this.phoneNumber, this.code);

  @override
  List<Object?> get props => [phoneNumber, code];
}