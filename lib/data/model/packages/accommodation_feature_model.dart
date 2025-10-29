class AccommodationFeatureInAccommodationList {
  final int id;
  final String title;
  final String icon;
  final String? description;
  final bool isPaid;
  final bool isPopular;

  AccommodationFeatureInAccommodationList({
    required this.id,
    required this.title,
    required this.icon,
    this.description,
    required this.isPaid,
    required this.isPopular,
  });

  factory AccommodationFeatureInAccommodationList.fromJson(Map<String, dynamic> json) {
    return AccommodationFeatureInAccommodationList(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      description: json['description'],
      isPaid: json['is_paid'] ?? false,
      isPopular: json['is_popular'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'description': description,
      'is_paid': isPaid,
      'is_popular': isPopular,
    };
  }
}
