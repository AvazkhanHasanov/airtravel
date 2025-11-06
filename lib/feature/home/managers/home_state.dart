import 'package:air_travel/core/status.dart';
import 'package:air_travel/data/model/packages/package_list_model.dart';
import 'package:air_travel/data/model/popular_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required Status popularStatus,
    required Status packagesStatus,
    required String? popularError,
    required String? packagesError,
    required List<PopularModel> popularPlace,
    required List<PackageListModel> packages,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
    popularStatus: Status.idle,
    packagesStatus: Status.idle,
    packagesError: null,
    popularError: null,
    popularPlace: [],
    packages: [],
  );
}
