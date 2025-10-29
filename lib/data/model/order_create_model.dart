class OrderCreateModel {
  final int package;
  final int? plan;

  OrderCreateModel({
    required this.package,
    this.plan,
  });

  factory OrderCreateModel.fromJson(Map<String, dynamic> json) {
    return OrderCreateModel(
      package: json['package'],
      plan: json['plan'],
    );
  }

  Map<String, dynamic> toJson() => {
    'package': package,
    'plan': plan,
  };
}
