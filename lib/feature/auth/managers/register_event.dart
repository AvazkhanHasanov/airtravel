import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class SubmitRegisterEvent extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String region;
  final String profilePhoto;

  const SubmitRegisterEvent( {
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.region,
    required this.profilePhoto,
  });

  @override
  List<Object?> get props => [firstName, lastName, phoneNumber, region,profilePhoto];
}