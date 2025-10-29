class AccommodationTypeInAccommodationRetrieve {
  final String title;
  final String picture;

  AccommodationTypeInAccommodationRetrieve({
    required this.title,
    required this.picture,
  });

  factory AccommodationTypeInAccommodationRetrieve.fromJson(Map<String, dynamic> json) {
    return AccommodationTypeInAccommodationRetrieve(
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
