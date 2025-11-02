class PlanTypeModel {
  final int id;
  final String title;
  final String? titleUz;
  final String? titleRu;
  final String? titleEn;
  final String? titleUk;

  PlanTypeModel({
    required this.id,
    required this.title,
    this.titleUz,
    this.titleRu,
    this.titleEn,
    this.titleUk,
  });

  factory PlanTypeModel.fromJson(Map<String, dynamic> json) {
    return PlanTypeModel(
      id: json['id'],
      title: json['title'],
      titleUz: json['title_uz'],
      titleRu: json['title_ru'],
      titleEn: json['title_en'],
      titleUk: json['title_uk'],
    );
  }
}
