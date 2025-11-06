import 'retrieve_feature_model.dart';
import 'retrieve_plan_type_model.dart';

class RetrievePlanModel {
  final int id;
  final RetrievePlanTypeModel type;
  final int price;
  final bool isDiscountActive;
  final int discount;
  final String? discountExpiryDate;
  final num discountedPrice;
  final List<RetrieveFeatureModel> features;
  final String? description;

  RetrievePlanModel({
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

  factory RetrievePlanModel.fromJson(Map<String, dynamic> json) {
    return RetrievePlanModel(
      id: json['id'],
      type: RetrievePlanTypeModel.fromJson(json['type']),
      price: json['price'],
      isDiscountActive: json['is_discount_active'],
      discount: json['discount'],
      discountExpiryDate: json['discount_expiry_date'],
      discountedPrice: json['discounted_price'],
      features: (json['features'] as List<dynamic>).map((e) => RetrieveFeatureModel.fromJson(e)).toList(),
      description: json['description'],
    );
  }
}
