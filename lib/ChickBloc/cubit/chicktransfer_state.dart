part of 'chicktransfer_cubit.dart';

@immutable
abstract class ChicktransferState {}

class ChicktransferInitial extends ChicktransferState {}

class Fetching extends ChicktransferState {}

class FetchCompleted extends ChicktransferState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends ChicktransferState {
  final String msg;

  FetchError(this.msg);
}
