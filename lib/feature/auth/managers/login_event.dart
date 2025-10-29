import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class SendPhoneNumberEvent extends LoginEvent {
  final String phoneNumber;

  const SendPhoneNumberEvent(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}
