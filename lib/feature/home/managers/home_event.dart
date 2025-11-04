part of 'home_bloc.dart';

sealed class HomeEvent {
  @override
  String toString() {
    return runtimeType.toString();
  }
}

final class GetPopularPlace extends HomeEvent {}
