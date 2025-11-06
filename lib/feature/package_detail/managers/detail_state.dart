import 'package:air_travel/core/status.dart';
import 'package:air_travel/data/model/packages/retrieve_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    required Status detailStatus,
    required String? detailError,
    required RetrieveModel? detail,
  }) = _DetailState;

  factory DetailState.initial()=> DetailState(
    detailStatus: Status.idle,
    detailError: null,
    detail: null
  );
}
