import 'plan_type_model.dart';

class OrderPlanModel {
  final int id;
  final PlanTypeModel type;

  OrderPlanModel({
    required this.id,
    required this.type,
  });

  factory OrderPlanModel.fromJson(Map<String, dynamic> json) {
    return OrderPlanModel(
      id: json['id'],
      type: PlanTypeModel.fromJson(json['type']),
    );
  }
}
