import 'package_list_model.dart';

class LikedPackageModel {
  final int count;
  final String next;
  final String previous;
  final List<PackageListModel> results;

  LikedPackageModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory LikedPackageModel.fromJson(Map<String, dynamic> json) {
    return LikedPackageModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List).map((e) => PackageListModel.fromJson(e)).toList(),
    );
  }
}
