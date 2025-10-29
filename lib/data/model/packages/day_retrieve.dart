class DayRetrieve {
  final int id;
  final int dayNumber;
  final String? date;
  final String? items;

  DayRetrieve({
    required this.id,
    required this.dayNumber,
    this.date,
    this.items,
  });

  factory DayRetrieve.fromJson(Map<String, dynamic> json) {
    return DayRetrieve(
      id: json['id'],
      dayNumber: json['day_number'],
      date: json['date'],
      items: json['items'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day_number': dayNumber,
      'date': date,
      'items': items,
    };
  }
}
