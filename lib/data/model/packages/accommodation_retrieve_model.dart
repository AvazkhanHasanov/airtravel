import 'accommodation_type_model.dart';
import 'city_model.dart';
import 'accommodation_feature_model.dart';
import 'accommodation_picture_model.dart';

class AccommodationRetrieve {
  final int id;
  final String title;
  final AccommodationTypeInAccommodationRetrieve type;
  final String longDescription;
  final String rating;
  final CityInAccommodationRetrieve city;
  final String country;
  final String address;
  final String? landmark;
  final List<AccommodationFeatureInAccommodationList> features;
  final String? iframe;
  final String? latitude;
  final String? longitude;
  final List<AccommodationPictureInAccommodationList> pictures;
  final String? embeddedLink;

  AccommodationRetrieve({
    required this.id,
    required this.title,
    required this.type,
    required this.longDescription,
    required this.rating,
    required this.city,
    required this.country,
    required this.address,
    this.landmark,
    required this.features,
    this.iframe,
    this.latitude,
    this.longitude,
    required this.pictures,
    this.embeddedLink,
  });

  factory AccommodationRetrieve.fromJson(Map<String, dynamic> json) {
    return AccommodationRetrieve(
      id: json['id'],
      title: json['title'],
      type: AccommodationTypeInAccommodationRetrieve.fromJson(json['type']),
      longDescription: json['long_description'],
      rating: json['rating'],
      city: CityInAccommodationRetrieve.fromJson(json['city']),
      country: json['country'],
      address: json['address'],
      landmark: json['landmark'],
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => AccommodationFeatureInAccommodationList.fromJson(e))
          .toList() ??
          [],
      iframe: json['iframe'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => AccommodationPictureInAccommodationList.fromJson(e))
          .toList() ??
          [],
      embeddedLink: json['embedded_link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.toJson(),
      'long_description': longDescription,
      'rating': rating,
      'city': city.toJson(),
      'country': country,
      'address': address,
      'landmark': landmark,
      'features': features.map((e) => e.toJson()).toList(),
      'iframe': iframe,
      'latitude': latitude,
      'longitude': longitude,
      'pictures': pictures.map((e) => e.toJson()).toList(),
      'embedded_link': embeddedLink,
    };
  }
}
