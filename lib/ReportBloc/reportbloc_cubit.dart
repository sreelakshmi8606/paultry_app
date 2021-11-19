// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';

part 'reportbloc_state.dart';

class ReportblocCubit extends Cubit<ReportblocState> {
  ReportblocCubit({required this.url}) : super(ReportblocInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate,DateTime toDate) async {
    //final List data = await web.getList();
    emit(reportFetching());
    try {
      final List data = await web.getChickTransfer(fromDate: fromDate,toDate: toDate);
      emit(reportReady(data: data));
        // final List rdata = await web.getReport();
        // emit(reportFetched(rdata: rdata));
    }
    catch (e) {
      print(e.toString());
      emit(reportError(
        e.toString(),
      ));
    }
  }
}
