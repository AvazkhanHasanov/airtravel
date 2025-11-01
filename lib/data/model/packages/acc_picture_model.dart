class AccPictureModel {
  final int id;
  final String picture;
  final bool isMain;

  AccPictureModel({
    required this.id,
    required this.picture,
    required this.isMain,
  });

  factory AccPictureModel.fromJson(Map<String, dynamic> json) {
    return AccPictureModel(
      id: json['id'],
      picture: json['picture'],
      isMain: json['is_main'] ,
    );
  }
}
