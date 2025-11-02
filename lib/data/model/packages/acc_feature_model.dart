class AccFeatureModel {
  final int id;
  final String title;
  final String icon;
  final String description;
  final bool isPaid;
  final bool isPopular;

  AccFeatureModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
    required this.isPaid,
    required this.isPopular,
  });

  factory AccFeatureModel.fromJson(Map<String, dynamic> json) {
    return AccFeatureModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      description: json['description'],
      isPaid: json['is_paid'],
      isPopular: json['is_popular'],
    );
  }
}
