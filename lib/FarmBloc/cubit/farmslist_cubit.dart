import 'package:bloc/bloc.dart';
import 'package:e_comm/webservices/WebServiceHelper.dart';
import 'package:meta/meta.dart';
import 'dart:core';

part 'farmslist_state.dart';

class FarmslistCubit extends Cubit<FarmslistState> {
  FarmslistCubit({required this.url}) : super(FarmslistInitial());
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

