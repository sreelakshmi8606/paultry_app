// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';

part 'masterhatcheryeditor_state.dart';

class MasterhatcheryeditorCubit extends Cubit<MasterhatcheryeditorState> {
  MasterhatcheryeditorCubit({required this.url})
      : super(MasterhatcheryeditorInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
    try {
      final List<Map> data = await web.getMasterHatcheryEditor();
      emit(DataReady(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(
        e.toString(),
      ));
    }
  }
}
