import 'activity_pictureIn_activity_retrieve.dart';

class ActivityRetrieve {
  final int id;
  final String title;
  final String address;
  final String? landmark;
  final String? description;
  final String? iframe;
  final String? latitude;
  final String? longitude;
  final List<ActivityPictureInActivityRetrieve> pictures;

  ActivityRetrieve({
    required this.id,
    required this.title,
    required this.address,
    this.landmark,
    this.description,
    this.iframe,
    this.latitude,
    this.longitude,
    required this.pictures,
  });

  factory ActivityRetrieve.fromJson(Map<String, dynamic> json) {
    return ActivityRetrieve(
      id: json['id'] ,
      title: json['title'] ,
      address: json['address'] ,
      landmark: json['landmark'],
      description: json['description'],
      iframe: json['iframe'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => ActivityPictureInActivityRetrieve.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'address': address,
      'landmark': landmark,
      'description': description,
      'iframe': iframe,
      'latitude': latitude,
      'longitude': longitude,
      'pictures': pictures.map((e) => e.toJson()).toList(),
    };
  }
}

