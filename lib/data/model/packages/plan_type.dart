class PlanType {
  final int id;
  final String title;
  final String? titleUz;
  final String? titleRu;
  final String? titleEn;
  final String? titleUk;

  PlanType({
    required this.id,
    required this.title,
    this.titleUz,
    this.titleRu,
    this.titleEn,
    this.titleUk,
  });

  factory PlanType.fromJson(Map<String, dynamic> json) {
    return PlanType(
      id: json['id'],
      title: json['title'],
      titleUz: json['title_uz'],
      titleRu: json['title_ru'],
      titleEn: json['title_en'],
      titleUk: json['title_uk'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'title_uz': titleUz,
      'title_ru': titleRu,
      'title_en': titleEn,
      'title_uk': titleUk,
    };
  }
}
