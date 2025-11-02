class PopularModel {
  final int id;
  final String title;
  final String description;
  final String picture;
  final String? getCount;

  PopularModel({
    required this.id,
    required this.title,
    required this.description,
    required this.picture,
     this.getCount,
  });

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      picture: json['picture'],
      getCount: json['getCount'],
    );
  }
}
