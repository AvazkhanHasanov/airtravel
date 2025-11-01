class DayInPackageRetrieve {
  final int id;
  final int dayNumber;
  final String? date;

  DayInPackageRetrieve({
    required this.id,
    required this.dayNumber,
    this.date,
  });

  factory DayInPackageRetrieve.fromJson(Map<String, dynamic> json) {
    return DayInPackageRetrieve(
      id: json['id'],
      dayNumber: json['day_number'],
      date: json['date'],
    );
  }
}
