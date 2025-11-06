part of 'detail_bloc.dart';

sealed class DetailEvent {
  @override
  String toString() {
    return runtimeType.toString();
  }
}

final class GetDetailPackage extends DetailEvent {
  final int id;

  GetDetailPackage({required this.id});
}
