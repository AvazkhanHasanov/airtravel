
import 'packages/plan_type.dart';

class PlanInOrder {
  final int id;
  final PlanType type;

  PlanInOrder({
    required this.id,
    required this.type,
  });

  factory PlanInOrder.fromJson(Map<String, dynamic> json) {
    return PlanInOrder(
      id: json['id'],
      type: PlanType.fromJson(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toJson(),
    };
  }
}
