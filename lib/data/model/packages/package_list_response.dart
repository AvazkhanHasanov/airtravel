

import 'package_list.dart';

class PackageListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PackageList> results;

  PackageListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PackageListResponse.fromJson(Map<String, dynamic> json) {
    return PackageListResponse(
      count: json['count'],
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
