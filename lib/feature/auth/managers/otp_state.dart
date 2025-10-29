import 'package:equatable/equatable.dart';

enum OtpStatus { initial, loading, success, failure }

class OtpState extends Equatable {
  final OtpStatus status;
  final String? errorMessage;

  const OtpState({
    this.status = OtpStatus.initial,
    this.errorMessage,
  });

  OtpState copyWith({
    OtpStatus? status,
    String? errorMessage,
  }) {
    return OtpState(
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}