import 'package:air_travel/core/status.dart';
import 'package:air_travel/data/model/gallery_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    required Status status,
    required String? error,
    required List<GalleryModel> gallery,
  }) = _OnboardingState;

  factory OnboardingState.initial() => OnboardingState(
    status: Status.idle,
    error: null,
    gallery: [],
  );
}
