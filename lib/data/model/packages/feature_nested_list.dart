class FeatureNestedList {
  final int id;
  final String title;
  final String? icon;

  FeatureNestedList({
    required this.id,
    required this.title,
    this.icon,
  });

  factory FeatureNestedList.fromJson(Map<String, dynamic> json) {
    return FeatureNestedList(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'icon': icon,
  };
}
