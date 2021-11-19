// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';

part 'hatcherytransactionlist_state.dart';

class HatcherytransactionlistCubit extends Cubit<HatcherytransactionlistState> {
  HatcherytransactionlistCubit({required this.url}) : super(HatcherytransactionlistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate,DateTime toDate) async {
    emit(Fetching());
    try {
      final List data = await web.getTransactionHatcheryList(fromDate: fromDate,toDate: toDate);
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
