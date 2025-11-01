class DestinationInPackageRetrieve {
  final String ccity;
  final int duration;

  DestinationInPackageRetrieve({
    required this.ccity,
    required this.duration,
  });

  factory DestinationInPackageRetrieve.fromJson(Map<String, dynamic> json) {
    return DestinationInPackageRetrieve(
      ccity: json['ccity'],
      duration: json['duration'],
    );
  }
}
