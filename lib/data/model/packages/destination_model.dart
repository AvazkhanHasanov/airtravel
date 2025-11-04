class DestinationModel {
  final String ccity;
  final int duration;

  DestinationModel({
    required this.ccity,
    required this.duration,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      ccity: json['ccity'],
      duration: json['duration'],
    );
  }
}
