class AccTypeModel {
  final String title;
  final String picture;

  AccTypeModel({
    required this.title,
    required this.picture,
  });

  factory AccTypeModel.fromJson(Map<String, dynamic> json) {
    return AccTypeModel(
      title: json['title'],
      picture: json['picture'],
    );
  }
}
