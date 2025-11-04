class ActivityPictureModel {
  final int id;
  final String picture;
  final bool isMain;

  ActivityPictureModel({
    required this.id,
    required this.picture,
    required this.isMain,
  });

  factory ActivityPictureModel.fromJson(Map<String, dynamic> json) {
    return ActivityPictureModel(
      id: json['id'],
      picture: json['picture'],
      isMain: json['is_main'],
    );
  }
}
