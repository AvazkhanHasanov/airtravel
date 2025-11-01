class FeatureNestedRetrieve {
  final int id;
  final String title;
  final String icon;
  final String? description;

  FeatureNestedRetrieve({
    required this.id,
    required this.title,
    required this.icon,
    this.description,
  });

  factory FeatureNestedRetrieve.fromJson(Map<String, dynamic> json) {
    return FeatureNestedRetrieve(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      description: json['description'],
    );
  }
}
