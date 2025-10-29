
import 'package:air_travel/data/model/packages/plan_in_package_list.dart';

import 'destination_in_package_list.dart';
import 'feature_nested_list.dart';

class PackageList {
  final int id;
  final String title;
  final int? flightFrom;
  final String? startDate;
  final String? endDate;
  final String? picture;
  final int? duration;
  final int? country;
  final List<DestinationInPackageList> destinations;
  final List<FeatureNestedList> coreFeatures;
  final List<PlanInPackageList> plans;
  final String? isLiked;

  PackageList({
    required this.id,
    required this.title,
    this.flightFrom,
    this.startDate,
    this.endDate,
    this.picture,
    this.duration,
    this.country,
    required this.destinations,
    required this.coreFeatures,
    required this.plans,
    this.isLiked,
  });

  factory PackageList.fromJson(Map<String, dynamic> json) {
    return PackageList(
      id: json['id'],
      title: json['title'],
      flightFrom: json['flight_from'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      picture: json['picture'],
      duration: json['duration'],
      country: json['country'],
      destinations: (json['destinations'] as List<dynamic>?)
          ?.map((e) => DestinationInPackageList.fromJson(e))
          .toList() ??
          [],
      coreFeatures: (json['core_features'] as List<dynamic>?)
          ?.map((e) => FeatureNestedList.fromJson(e))
          .toList() ??
          [],
      plans: (json['plans'] as List<dynamic>?)
          ?.map((e) => PlanInPackageList.fromJson(e))
          .toList() ??
          [],
      isLiked: json['is_liked'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'flight_from': flightFrom,
    'start_date': startDate,
    'end_date': endDate,
    'picture': picture,
    'duration': duration,
    'country': country,
    'destinations': destinations.map((e) => e.toJson()).toList(),
    'core_features': coreFeatures.map((e) => e.toJson()).toList(),
    'plans': plans.map((e) => e.toJson()).toList(),
    'is_liked': isLiked,
  };
}
