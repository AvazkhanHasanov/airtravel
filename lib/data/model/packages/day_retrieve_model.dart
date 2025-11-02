class DayRetrieveModel {
  final int id;
  final int dayNumber;
  final String date;
  final String items;

  DayRetrieveModel({
    required this.id,
    required this.dayNumber,
    required this.date,
    required this.items,
  });

  factory DayRetrieveModel.fromJson(Map<String, dynamic> json) {
    return DayRetrieveModel(
      id: json['id'],
      dayNumber: json['day_number'],
      date: json['date'],
      items: json['items'],
    );
  }
}
