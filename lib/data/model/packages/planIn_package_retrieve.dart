
import 'feature_nested_retrieve.dart';
import 'plan_typeIn_plan_retrieve.dart';

class PlanInPackageRetrieve {
  final int id;
  final PlanTypeInPlanRetrieve type;
  final int price;
  final bool isDiscountActive;
  final int discount;
  final String? discountExpiryDate;
  final String discountedPrice;
  final List<FeatureNestedRetrieve> features;
  final String? description;

  PlanInPackageRetrieve({
    required this.id,
    required this.type,
    required this.price,
    required this.isDiscountActive,
    required this.discount,
    this.discountExpiryDate,
    required this.discountedPrice,
    required this.features,
    this.description,
  });

  factory PlanInPackageRetrieve.fromJson(Map<String, dynamic> json) {
    return PlanInPackageRetrieve(
      id: json['id'],
      type: PlanTypeInPlanRetrieve.fromJson(json['type']),
      price: json['price'],
      isDiscountActive: json['is_discount_active'],
      discount: json['discount'],
      discountExpiryDate: json['discount_expiry_date'],
      discountedPrice: json['discounted_price'] ?? '',
      features: (json['features'] as List<dynamic>)
          .map((e) => FeatureNestedRetrieve.fromJson(e))
          .toList(),
      description: json['description'],
    );
  }
}
