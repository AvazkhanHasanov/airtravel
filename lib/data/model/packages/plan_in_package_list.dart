import 'feature_nested_list.dart';

class PlanInPackageList {
  final int id;
  final String? type;
  final int price;
  final int discount;
  final bool isDiscountActive;
  final String? discountExpiryDate;
  final String? discountedPrice;
  final List<FeatureNestedList> features;

  PlanInPackageList({
    required this.id,
    this.type,
    required this.price,
    required this.discount,
    required this.isDiscountActive,
    this.discountExpiryDate,
    this.discountedPrice,
    required this.features,
  });

  factory PlanInPackageList.fromJson(Map<String, dynamic> json) {
    return PlanInPackageList(
      id: json['id'],
      type: json['type'],
      price: json['price'],
      discount: json['discount'],
      isDiscountActive: json['is_discount_active'] ?? false,
      discountExpiryDate: json['discount_expiry_date'],
      discountedPrice: json['discounted_price'],
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeatureNestedList.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'price': price,
    'discount': discount,
    'is_discount_active': isDiscountActive,
    'discount_expiry_date': discountExpiryDate,
    'discounted_price': discountedPrice,
    'features': features.map((e) => e.toJson()).toList(),
  };
}
