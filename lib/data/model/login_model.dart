class LoginModel {
  final String phoneNumber;

  LoginModel({
    required this.phoneNumber,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      phoneNumber: json['phone_number'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
    };
  }
}
