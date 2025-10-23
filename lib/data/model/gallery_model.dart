class GalleryModel {
  final int id;
  final String title;
  final String picture;
  final String prompt;

  GalleryModel({
    required this.id,
    required this.title,
    required this.picture,
    required this.prompt,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'],
      title: json['title'],
      picture: json['picture'],
      prompt: json['prompt'],
    );
  }
}
