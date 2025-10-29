class DiscountModel {
  final int id;
  final String title;
  final String? description;
  final int maxDiscount;
  final DateTime expiryDate;

  const DiscountModel({
    required this.id,
    required this.title,
    this.description,
    required this.maxDiscount,
    required this.expiryDate,
  });

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      maxDiscount: json['max_discount'],
      expiryDate: DateTime.parse(json['expiry_date']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'max_discount': maxDiscount,
    'expiry_date': expiryDate.toIso8601String(),
    //Holat	Natija
    // expiryDate ni JSON’da bevosita bersangiz	 Xatolik: DateTime JSON serializable emas
    //expiryDate.toIso8601String() qo‘ysangiz
    // ✅ To‘g‘ri format, API uchun tayyor string
  };
}
