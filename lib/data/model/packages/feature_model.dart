class FeatureModel {
  final int id;
  final String title;
  final String icon;

  FeatureModel({
    required this.id,
    required this.title,
    required this.icon,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
    );
  }
}
