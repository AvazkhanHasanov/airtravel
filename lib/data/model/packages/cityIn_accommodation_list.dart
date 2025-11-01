class CityInAccommodationList {
  final int id;
  final String title;

  CityInAccommodationList({
    required this.id,
    required this.title,
  });

  factory CityInAccommodationList.fromJson(Map<String, dynamic> json) {
    return CityInAccommodationList(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
