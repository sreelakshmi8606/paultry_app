import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';

part 'chicktransfer_state.dart';

class ChicktransferCubit extends Cubit<ChicktransferState> {
  ChicktransferCubit({required this.url}) : super(ChicktransferInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate,DateTime toDate) async {
    emit(Fetching());
    try {
      final List data = await web.getChickTransfer(fromDate: fromDate,toDate: toDate);
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
