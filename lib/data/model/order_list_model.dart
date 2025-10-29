
import 'plan_in_order.dart';

class OrderList {
  final int id;
  final String package;
  final PlanInOrder plan;
  final int priceTotal;
  final int? pricePaid;
  final String getPriceToPay;
  final String status;
  final DateTime created;
  final String fromCity;
  final String toCity;

  OrderList({
    required this.id,
    required this.package,
    required this.plan,
    required this.priceTotal,
    this.pricePaid,
    required this.getPriceToPay,
    required this.status,
    required this.created,
    required this.fromCity,
    required this.toCity,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) {
    return OrderList(
      id: json['id'] ,
      package: json['package'],
      plan: PlanInOrder.fromJson(json['plan']),
      priceTotal: json['price_total'],
      pricePaid: json['price_paid'],
      getPriceToPay: json['get_price_to_pay'],
      status: json['status'],
      created: DateTime.tryParse(json['created'] ?? '') ?? DateTime.now(),
      fromCity: json['from_city'],
      toCity: json['to_city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'package': package,
      'plan': plan.toJson(),
      'price_total': priceTotal,
      'price_paid': pricePaid,
      'get_price_to_pay': getPriceToPay,
      'status': status,
      'created': created.toIso8601String(),
      'from_city': fromCity,
      'to_city': toCity,
    };
  }
}