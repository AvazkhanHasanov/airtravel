class RetrieveFeatureModel {
  final int id;
  final String title;
  final String icon;
  final String? description;

  RetrieveFeatureModel({
    required this.id,
    required this.title,
    required this.icon,
     this.description,
  });

  factory RetrieveFeatureModel.fromJson(Map<String, dynamic> json) {
    return RetrieveFeatureModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      description: json['description'],
    );
  }
}
