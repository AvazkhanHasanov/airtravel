import 'acc_type_model.dart';
import 'acc_city_model.dart';

class AccListModel {
  final int id;
  final String title;
  final AccTypeModel type;
  final String shortDescription;
  final String rating;
  final String picture;
  final AccCityModel city;
  final String country;
  final String embeddedLink;

  AccListModel({
    required this.id,
    required this.title,
    required this.type,
    required this.shortDescription,
    required this.rating,
    required this.picture,
    required this.city,
    required this.country,
    required this.embeddedLink,
  });

  factory AccListModel.fromJson(Map<String, dynamic> json) {
    return AccListModel(
      id: json['id'],
      title: json['title'],
      type: AccTypeModel.fromJson(json['type']),
      shortDescription: json['short_description'],
      rating: json['rating'],
      picture: json['picture'],
      city: AccCityModel.fromJson(json['city']),
      country: json['country'],
      embeddedLink: json['embedded_link'],
    );
  }
}
