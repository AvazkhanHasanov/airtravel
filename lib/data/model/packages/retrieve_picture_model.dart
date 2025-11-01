class RetrievePictureModel {
  final int id;
  final String picture;
  final bool isMain;

  RetrievePictureModel({
    required this.id,
    required this.picture,
    required this.isMain,
  });

  factory RetrievePictureModel.fromJson(Map<String, dynamic> json) {
    return RetrievePictureModel(
      id: json['id'],
      picture: json['picture'],
      isMain: json['is_main'],
    );
  }
}
