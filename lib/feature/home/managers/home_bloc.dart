import 'package:air_travel/core/status.dart';
import 'package:air_travel/data/repository/package_repository.dart';
import 'package:air_travel/data/repository/popular_repository.dart';
import 'package:air_travel/feature/home/managers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PopularRepository _popularRepo;
  final PackageRepository _packageRepo;

  HomeBloc({
    required PopularRepository popularRepo,
    required PackageRepository packageRepo,
  }) : _popularRepo = popularRepo,
       _packageRepo = packageRepo,
       super(HomeState.initial()) {
    on<GetPopularPlace>(_fetchPopular);
    on<GetPackages>(_fetchPackages);
  }

  Future<void> _fetchPopular(GetPopularPlace event, Emitter<HomeState> emit) async {
    emit(state.copyWith(popularStatus: Status.loading));
    final result = await _popularRepo.getAll();
    result.fold(
      (error) => emit(state.copyWith(popularStatus: Status.error, popularError: error.toString())),
      (value) => emit(state.copyWith(popularStatus: Status.success, popularPlace: value)),
    );
  }

  Future<void> _fetchPackages(GetPackages event, Emitter<HomeState> emit) async {
    emit(state.copyWith(packagesStatus: Status.loading));
    final result = await _packageRepo.getPackages();
    result.fold(
      (error) => emit(state.copyWith(packagesStatus: Status.error, packagesError: error.toString())),
      (value) => emit(state.copyWith(packagesStatus: Status.success, packages: value)),
    );
  }
}
