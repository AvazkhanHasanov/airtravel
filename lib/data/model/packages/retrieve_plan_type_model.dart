class RetrievePlanTypeModel {
  final String title;

  RetrievePlanTypeModel({required this.title});

  factory RetrievePlanTypeModel.fromJson(Map<String, dynamic> json) {
    return RetrievePlanTypeModel(title: json['title']);
  }
}
