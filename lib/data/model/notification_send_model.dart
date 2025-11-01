class NotificationSendModel {
  final String title;
  final String body;
  final String image;

  NotificationSendModel({
    required this.title,
    required this.body,
    required this.image,
  });

  factory NotificationSendModel.fromJson(Map<String, dynamic> json) {
    return NotificationSendModel(
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
