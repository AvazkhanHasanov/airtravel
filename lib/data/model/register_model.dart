class RegisterModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String region;
  final String profilePhoto;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.region,
    required this.profilePhoto,
  });
   Map<String,dynamic> toJson() {
     return {
       "firstName" : firstName,
       "lastName" : lastName,
       "phoneNumber" : phoneNumber,
       "region" : region,
       "profilePhoto" : profilePhoto,
     };
   }
}

class RegisterResponseModel {
  final String message;
  final bool success;

  RegisterResponseModel({
    required this.message,
    required this.success,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'] ?? 'Muvaffaqiyatli ro\'yxatdan o\'tdingiz',
      success: json['success'] ?? true,
    );
  }
}
