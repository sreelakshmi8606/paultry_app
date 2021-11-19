part of 'masterhatcherylist_cubit.dart';

@immutable
abstract class MasterhatcherylistState {}

class MasterhatcherylistInitial extends MasterhatcherylistState {}

class Fetching extends MasterhatcherylistState {}

class FetchCompleted extends MasterhatcherylistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends MasterhatcherylistState {
  final String msg;

  FetchError(this.msg);
}
