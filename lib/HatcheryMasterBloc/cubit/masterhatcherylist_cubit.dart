import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';

part 'masterhatcherylist_state.dart';

class MasterhatcherylistCubit extends Cubit<MasterhatcherylistState> {
  MasterhatcherylistCubit({required this.url})
      : super(MasterhatcherylistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
    try {
      final List data = await web.getMasterHatcheryList();
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
