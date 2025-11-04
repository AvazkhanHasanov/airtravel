import 'activity_picture_model.dart';

class ActivityRetrieveModel {
  final int id;
  final String title;
  final String address;
  final String landmark;
  final String description;
  final String iframe;
  final String latitude;
  final String longitude;
  final List<ActivityPictureModel> pictures;

  ActivityRetrieveModel({
    required this.id,
    required this.title,
    required this.address,
    required this.landmark,
    required this.description,
    required this.iframe,
    required this.latitude,
    required this.longitude,
    required this.pictures,
  });

  factory ActivityRetrieveModel.fromJson(Map<String, dynamic> json) {
    return ActivityRetrieveModel(
      id: json['id'],
      title: json['title'],
      address: json['address'],
      landmark: json['landmark'],
      description: json['description'],
      iframe: json['iframe'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      pictures: (json['pictures'] as List).map((e) => ActivityPictureModel.fromJson(e)).toList(),
    );
  }
}
