class PlanTypeInPlanRetrieve {
  final String title;

  PlanTypeInPlanRetrieve({required this.title});

  factory PlanTypeInPlanRetrieve.fromJson(Map<String, dynamic> json) {
    return PlanTypeInPlanRetrieve(title: json['title']);
  }
}
