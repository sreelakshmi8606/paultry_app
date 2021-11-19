part of 'branchlist_cubit.dart';

@immutable
abstract class BranchlistState {}

class BranchlistInitial extends BranchlistState {}
class Fetching extends BranchlistState {}

class FetchCompleted extends BranchlistState {
  final List data;
  FetchCompleted({required this.data});
}

class FetchError extends BranchlistState {
  final String msg;
  FetchError(this.msg);
}
