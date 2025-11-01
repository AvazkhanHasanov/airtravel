import 'package:air_travel/data/model/packages/plan_model.dart';

import 'destination_model.dart';
import 'feature_model.dart';

class PackageListModel {
  final int id;
  final String title;
  final int flightFrom;
  final String startDate;
  final String endDate;
  final String picture;
  final int duration;
  final int country;
  final List<DestinationModel> destinations;
  final List<FeatureModel> coreFeatures;
  final List<PlanModel> plans;
  final String isLiked;

  PackageListModel({
    required this.id,
    required this.title,
    required this.flightFrom,
    required this.startDate,
    required this.endDate,
    required this.picture,
    required this.duration,
    required this.country,
    required this.destinations,
    required this.coreFeatures,
    required this.plans,
    required this.isLiked,
  });

  factory PackageListModel.fromJson(Map<String, dynamic> json) {
    return PackageListModel(
      id: json['id'],
      title: json['title'],
      flightFrom: json['flight_from'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      picture: json['picture'],
      duration: json['duration'],
      country: json['country'],
      destinations: (json['destinations'] as List).map((e) => DestinationModel.fromJson(e)).toList(),
      coreFeatures: (json['core_features'] as List).map((e) => FeatureModel.fromJson(e)).toList(),
      plans: (json['plans'] as List).map((e) => PlanModel.fromJson(e)).toList(),
      isLiked: json['is_liked'],
    );
  }
}
