import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';

part 'dailylist_state.dart';

class DailylistCubit extends Cubit<DailylistState> {
  DailylistCubit({required this.url}) : super(DailylistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData(DateTime fromDate,DateTime toDate) async {
    emit(Fetching());
    try {
      final List data = await web.getDailyEntryList(fromDate: fromDate,toDate: toDate);
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}


