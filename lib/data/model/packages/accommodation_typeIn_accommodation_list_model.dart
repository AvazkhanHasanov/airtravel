class AccommodationTypeInAccommodationList {
  final String title;
  final String picture;

  AccommodationTypeInAccommodationList({
    required this.title,
    required this.picture,
  });

  factory AccommodationTypeInAccommodationList.fromJson(Map<String, dynamic> json) {
    return AccommodationTypeInAccommodationList(
      title: json['title'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'picture': picture,
    };
  }
}
