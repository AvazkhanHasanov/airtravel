class PictureInPackageRetrieve {
  final int id;
  final String picture;
  final bool isMain;

  PictureInPackageRetrieve({
    required this.id,
    required this.picture,
    required this.isMain,
  });

  factory PictureInPackageRetrieve.fromJson(Map<String, dynamic> json) {
    return PictureInPackageRetrieve(
      id: json['id'],
      picture: json['picture'],
      isMain: json['is_main'],
    );
  }
}
