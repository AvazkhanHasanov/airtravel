
import 'package_list.dart';

class PackageListLikedResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PackageList> results;

  PackageListLikedResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PackageListLikedResponse.fromJson(Map<String, dynamic> json) {
    return PackageListLikedResponse(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PackageList.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    'next': next,
    'previous': previous,
    'results': results.map((e) => e.toJson()).toList(),
  };
}
