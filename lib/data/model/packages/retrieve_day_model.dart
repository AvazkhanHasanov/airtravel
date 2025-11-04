class RetrieveDayModel {
  final int id;
  final int dayNumber;
  final String date;

  RetrieveDayModel({
    required this.id,
    required this.dayNumber,
    required  this.date,
  });

  factory RetrieveDayModel.fromJson(Map<String, dynamic> json) {
    return RetrieveDayModel(
      id: json['id'],
      dayNumber: json['day_number'],
      date: json['date'],
    );
  }
}
