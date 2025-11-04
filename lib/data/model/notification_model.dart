class NotificationModel {
  final String title;
  final String body;
  final String image;

  NotificationModel({
    required this.title,
    required this.body,
    required this.image,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    'image': image,
  };
}
