import 'acc_city_model.dart';
import 'acc_feature_model.dart';
import 'acc_picture_model.dart';
import 'acc_type_model.dart';

class AccRetrieveModel {
  final int id;
  final String title;
  final AccTypeModel type;
  final String longDescription;
  final String rating;
  final AccCityModel city;
  final String country;
  final String address;
  final String landmark;
  final List<AccFeatureModel> features;
  final String iframe;
  final String latitude;
  final String longitude;
  final List<AccPictureModel> pictures;
  final String embeddedLink;

  AccRetrieveModel({
    required this.id,
    required this.title,
    required this.type,
    required this.longDescription,
    required this.rating,
    required this.city,
    required this.country,
    required this.address,
    required this.landmark,
    required this.features,
    required this.iframe,
    required this.latitude,
    required this.longitude,
    required this.pictures,
    required this.embeddedLink,
  });

  factory AccRetrieveModel.fromJson(Map<String, dynamic> json) {
    return AccRetrieveModel(
      id: json['id'],
      title: json['title'],
      type: AccTypeModel.fromJson(json['type']),
      longDescription: json['long_description'],
      rating: json['rating'],
      city: AccCityModel.fromJson(json['city']),
      country: json['country'],
      address: json['address'],
      landmark: json['landmark'],
      features: (json['features'] as List).map((e) => AccFeatureModel.fromJson(e)).toList(),
      iframe: json['iframe'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      pictures: (json['pictures'] as List).map((e) => AccPictureModel.fromJson(e)).toList(),
      embeddedLink: json['embedded_link'],
    );
  }
}
