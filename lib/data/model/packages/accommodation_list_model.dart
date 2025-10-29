import 'accommodation_typeIn_accommodation_list_model.dart';
import 'cityIn_accommodation_list.dart';

class AccommodationList {
  final int id;
  final String title;
  final AccommodationTypeInAccommodationList type;
  final String shortDescription;
  final String rating;
  final String picture;
  final CityInAccommodationList city;
  final String country;
  final String? embeddedLink;

  AccommodationList({
    required this.id,
    required this.title,
    required this.type,
    required this.shortDescription,
    required this.rating,
    required this.picture,
    required this.city,
    required this.country,
    this.embeddedLink,
  });

  factory AccommodationList.fromJson(Map<String, dynamic> json) {
    return AccommodationList(
      id: json['id'],
      title: json['title'],
      type: AccommodationTypeInAccommodationList.fromJson(json['type']),
      shortDescription: json['short_description'],
      rating: json['rating'],
      picture: json['picture'],
      city: CityInAccommodationList.fromJson(json['city']),
      country: json['country'],
      embeddedLink: json['embedded_link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.toJson(),
      'short_description': shortDescription,
      'rating': rating,
      'picture': picture,
      'city': city.toJson(),
      'country': country,
      'embedded_link': embeddedLink,
    };
  }
}

