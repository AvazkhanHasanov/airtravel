class ActivityPictureInActivityRetrieve {
  final int id;
  final String picture;
  final bool isMain;

  ActivityPictureInActivityRetrieve({
    required this.id,
    required this.picture,
    required this.isMain,
  });

  factory ActivityPictureInActivityRetrieve.fromJson(
      Map<String, dynamic> json) {
    return ActivityPictureInActivityRetrieve(
      id: json['id'] ?? 0,
      picture: json['picture'] ?? '',
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
