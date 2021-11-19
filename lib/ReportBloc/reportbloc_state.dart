// ignore_for_file: camel_case_types

part of 'reportbloc_cubit.dart';

@immutable
abstract class ReportblocState {}

class ReportblocInitial extends ReportblocState {}

class reportFetching extends ReportblocState {}

class reportReady extends ReportblocState {
  final List data;
  reportReady({required this.data});
}

class reportFetched extends ReportblocState {
  final List rdata;
  reportFetched({required this.rdata});
}

class reportError extends ReportblocState {
  final String msg;

  reportError(this.msg);
}
