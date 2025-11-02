import 'order_plan_model.dart';

class OrderModel {
  final int id;
  final String package;
  final OrderPlanModel plan;
  final int priceTotal;
  final int pricePaid;
  final String getPriceToPay;
  final String status;
  final DateTime created;
  final String fromCity;
  final String toCity;

  OrderModel({
    required this.id,
    required this.package,
    required this.plan,
    required this.priceTotal,
    required this.pricePaid,
    required this.getPriceToPay,
    required this.status,
    required this.created,
    required this.fromCity,
    required this.toCity,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      package: json['package'],
      plan: OrderPlanModel.fromJson(json['plan']),
      priceTotal: json['price_total'],
      pricePaid: json['price_paid'],
      getPriceToPay: json['get_price_to_pay'],
      status: json['status'],
      created: DateTime.parse(json['created']),
      fromCity: json['from_city'],
      toCity: json['to_city'],
    );
  }
}
