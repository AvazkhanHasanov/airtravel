import 'package:air_travel/data/model/packages/retrieve_picture_model.dart';

import 'retrieve_day_model.dart';
import 'destination_model.dart';
import 'retrieve_feature_model.dart';
import 'retrieve_plan_model.dart';

class RetrieveModel {
  final int id;
  final String title;
  final int flightFrom;
  final String startDate;
  final String endDate;
  final String description;
  final int country;
  final List<RetrievePictureModel> pictures;
  final int duration;
  final List<DestinationModel> destinations;
  final List<RetrieveFeatureModel> coreFeatures;
  final List<RetrievePlanModel> plans;
  final List<RetrieveDayModel> days;

  RetrieveModel({
    required this.id,
    required this.title,
    required this.flightFrom,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.country,
    required this.pictures,
    required this.duration,
    required this.destinations,
    required this.coreFeatures,
    required this.plans,
    required this.days,
  });

  factory RetrieveModel.fromJson(Map<String, dynamic> json) {
    return RetrieveModel(
      id: json['id'],
      title: json['title'],
      flightFrom: json['flight_from'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      description: json['description'],
      country: json['country'],
      pictures: (json['pictures'] as List).map((e) => RetrievePictureModel.fromJson(e)).toList(),
      duration: json['duration'],
      destinations: (json['destinations'] as List).map((e) => DestinationModel.fromJson(e)).toList(),
      coreFeatures: (json['core_features'] as List).map((e) => RetrieveFeatureModel.fromJson(e)).toList(),
      plans: (json['plans'] as List).map((e) => RetrievePlanModel.fromJson(e)).toList(),
      days: (json['days'] as List).map((e) => RetrieveDayModel.fromJson(e)).toList(),
    );
  }
}
