class AccommodationPictureInAccommodationList {
  final int id;
  final String picture;
  final bool isMain;

  AccommodationPictureInAccommodationList({
    required this.id,
    required this.picture,
    required this.isMain,
  });

  factory AccommodationPictureInAccommodationList.fromJson(Map<String, dynamic> json) {
    return AccommodationPictureInAccommodationList(
      id: json['id'],
      picture: json['picture'],
      isMain: json['is_main'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'picture': picture,
      'is_main': isMain,
    };
  }
}
