import 'package:air_travel/core/status.dart';
import 'package:air_travel/data/repository/gallery_repository.dart';
import 'package:air_travel/feature/onboarding/managers/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final GalleryRepository _galleryRepo;

  OnboardingCubit({required GalleryRepository galleryRepo})
    : _galleryRepo = galleryRepo,
      super(OnboardingState.initial()) {
    fetchImage();
  }

  Future<void> fetchImage() async {
    emit(state.copyWith(status: Status.loading));
    final result = await _galleryRepo.getAll();
    result.fold(
      (error) => emit(state.copyWith(status: Status.error, error: error.toString())),
      (value) => emit(state.copyWith(status: Status.success, gallery: value, error: null)),
    );
  }
}
