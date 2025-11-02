import 'package:air_travel/core/status.dart';
import 'package:air_travel/data/repository/popular_repository.dart';
import 'package:air_travel/feature/home/managers/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PopularRepository _popularRepo;

  HomeBloc({required PopularRepository popularRepo}) : _popularRepo = popularRepo, super(HomeState.initial()) {
    on<GetPopularPlace>(_fetchPopular);
  }

  Future<void> _fetchPopular(GetPopularPlace event, Emitter<HomeState> emit) async {
    emit(state.copyWith(popularStatus: Status.loading));
    final result = await _popularRepo.getAll();
    result.fold(
      (error) => emit(state.copyWith(popularStatus: Status.error, popularError: error.toString())),
      (value) => emit(state.copyWith(popularStatus: Status.success, popularPlace: value)),
    );
  }
}
