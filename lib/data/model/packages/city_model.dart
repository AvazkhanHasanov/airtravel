class CityInAccommodationRetrieve {
  final int id;
  final String title;

  CityInAccommodationRetrieve({
    required this.id,
    required this.title,
  });

  factory CityInAccommodationRetrieve.fromJson(Map<String, dynamic> json) {
    return CityInAccommodationRetrieve(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
