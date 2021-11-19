part of 'dailylist_cubit.dart';

@immutable
abstract class DailylistState {}

class DailylistInitial extends DailylistState {}
class Fetching extends DailylistState {}

class FetchCompleted extends DailylistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends DailylistState {
  final String msg;

  FetchError(this.msg);
}
