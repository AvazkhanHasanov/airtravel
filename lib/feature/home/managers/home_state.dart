import 'package:air_travel/core/status.dart';
import 'package:air_travel/data/model/popular_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required Status popularStatus,
    required String? popularError,
    required List<PopularModel> popularPlace,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
    popularStatus: Status.idle,
    popularError: null,
    popularPlace: [],
  );
}
