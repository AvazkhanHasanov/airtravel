class BaseModel {
  final int id;
  final String title;

  BaseModel({required this.id, required this.title});

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
