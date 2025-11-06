import 'package:air_travel/core/status.dart';
import 'package:air_travel/data/repository/package_repository.dart';
import 'package:air_travel/feature/package_detail/managers/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_event.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final PackageRepository _packageRepo;

  DetailBloc({required PackageRepository packageRepo}) : _packageRepo = packageRepo, super(DetailState.initial()) {
    on<GetDetailPackage>(_fetchDetail);
  }

  Future<void> _fetchDetail(GetDetailPackage event, Emitter<DetailState> emit) async {
    emit(state.copyWith(detailStatus: Status.loading));
    final result = await _packageRepo.getPackageById(event.id);
    result.fold(
      (error) => emit(state.copyWith(detailStatus: Status.error, detailError: error.toString())),
      (value) => emit(state.copyWith(detailStatus: Status.success, detail: value)),
    );
  }
}
