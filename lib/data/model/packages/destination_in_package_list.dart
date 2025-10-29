class DestinationInPackageList {
  final String? ccity;
  final int duration;

  DestinationInPackageList({
    this.ccity,
    required this.duration,
  });

  factory DestinationInPackageList.fromJson(Map<String, dynamic> json) {
    return DestinationInPackageList(
      ccity: json['ccity'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() => {
    'ccity': ccity,
    'duration': duration,
  };
}
