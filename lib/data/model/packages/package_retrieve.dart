
import 'package:air_travel/data/model/packages/pictureIn_package_retrieve.dart';

import 'dayIn_package_retrieve.dart';
import 'destinationIn_package_retrieve.dart';
import 'feature_nested_retrieve.dart';
import 'planIn_package_retrieve.dart';

class PackageRetrieve {
  final int id;
  final String title;
  final int? flightFrom;
  final String? startDate;
  final String? endDate;
  final String? description;
  final int? country;
  final List<PictureInPackageRetrieve> pictures;
  final int duration;
  final List<DestinationInPackageRetrieve> destinations;
  final List<FeatureNestedRetrieve> coreFeatures;
  final List<PlanInPackageRetrieve> plans;
  final List<DayInPackageRetrieve> days;

  PackageRetrieve({
    required this.id,
    required this.title,
    this.flightFrom,
    this.startDate,
    this.endDate,
    this.description,
    this.country,
    required this.pictures,
    required this.duration,
    required this.destinations,
    required this.coreFeatures,
    required this.plans,
    required this.days,
  });

  factory PackageRetrieve.fromJson(Map<String, dynamic> json) {
    return PackageRetrieve(
      id: json['id'],
      title: json['title'],
      flightFrom: json['flight_from'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      description: json['description'],
      country: json['country'],
      pictures: (json['pictures'] as List<dynamic>)
          .map((e) => PictureInPackageRetrieve.fromJson(e))
          .toList(),
      duration: json['duration'],
      destinations: (json['destinations'] as List<dynamic>)
          .map((e) => DestinationInPackageRetrieve.fromJson(e))
          .toList(),
      coreFeatures: (json['core_features'] as List<dynamic>)
          .map((e) => FeatureNestedRetrieve.fromJson(e))
          .toList(),
      plans: (json['plans'] as List<dynamic>)
          .map((e) => PlanInPackageRetrieve.fromJson(e))
          .toList(),
      days: (json['days'] as List<dynamic>)
          .map((e) => DayInPackageRetrieve.fromJson(e))
          .toList(),
    );
  }
}
