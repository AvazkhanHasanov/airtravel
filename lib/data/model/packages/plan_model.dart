import 'feature_model.dart';

class PlanModel {
  final int id;
  final String type;
  final int price;
  final int discount;
  final bool isDiscountActive;
  final String? discountExpiryDate;
  final num  discountedPrice;
  final List<FeatureModel> features;

  PlanModel({
    required this.id,
    required this.type,
    required this.price,
    required this.discount,
    required this.isDiscountActive,
    this.discountExpiryDate,
    required this.discountedPrice,
    required this.features,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['id'],
      type: json['type'],
      price: json['price'],
      discount: json['discount'],
      isDiscountActive: json['is_discount_active'],
      discountExpiryDate: json['discount_expiry_date'],
      discountedPrice: json['discounted_price'],
      features: (json['features'] as List).map((e) => FeatureModel.fromJson(e)).toList(),
    );
  }
}
