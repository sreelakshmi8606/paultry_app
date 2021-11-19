part of 'masterhatcheryeditor_cubit.dart';

@immutable
abstract class MasterhatcheryeditorState {}

class MasterhatcheryeditorInitial extends MasterhatcheryeditorState {}

class Fetching extends MasterhatcheryeditorState {}

class DataReady extends MasterhatcheryeditorState {
  final List<Map> data;
  DataReady({required this.data});
}

class FetchError extends MasterhatcheryeditorState {
  final String msg;

  FetchError(this.msg);
}
