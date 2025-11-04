class AccCityModel {
  final int id;
  final String title;

  AccCityModel({
    required this.id,
    required this.title,
  });

  factory AccCityModel.fromJson(Map<String, dynamic> json) {
    return AccCityModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
