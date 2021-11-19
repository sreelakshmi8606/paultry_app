part of 'chickeditor_cubit.dart';

@immutable
abstract class ChickeditorState {}

class ChickeditorInitial extends ChickeditorState {}

class Fetching extends ChickeditorState {}

class DataReady extends ChickeditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends ChickeditorState {
  final String msg;

  FetchError(this.msg);
}
