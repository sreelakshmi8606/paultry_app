// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';
part 'branchlist_state.dart';

class BranchlistCubit extends Cubit<BranchlistState> {
  BranchlistCubit({required this.url}) : super(BranchlistInitial());
  WebserviceHelper web = WebserviceHelper();
  final String url;
  void fetchData() async {
    emit(Fetching());
    try {
      print('fetching');
      final List data = await web.getList();
      print('Fetch DONE');
      emit(FetchCompleted(data: data));
    } catch (e) {
      print(e.toString());
      emit(FetchError(e.toString(),));
    }
  }
}


