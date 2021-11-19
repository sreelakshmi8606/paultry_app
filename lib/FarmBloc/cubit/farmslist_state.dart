part of 'farmslist_cubit.dart';

@immutable
abstract class FarmslistState {}

class FarmslistInitial extends FarmslistState {}

class Fetching extends FarmslistState {}

class FetchCompleted extends FarmslistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends FarmslistState {
  final String msg;
  FetchError(this.msg);
}
