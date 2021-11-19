import 'package:dio/dio.dart';
import 'package:e_comm/data_models/transactions/daily_entry_form.dart';
import 'package:e_comm/data_models/transactions/chick_transfer.dart';

class WebserviceDailyEntry {
  Dio dio = Dio(BaseOptions(
    headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
  ));

//to put data to json/save to cloud

  Future<bool> saveRecord({required DailyEntryFormDataModel model}) async {
    model.toJson();
    String url = "https://31.220.109.198:8050/CreateVoucher ";

    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      // Response response = await dio.post(url, data: model.toJson());
      // print('Response : ${response.data}');
      await dio.post(url, data: model.toJson());
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }

    return true;
  }

  Future<bool> chickRecord({required ChickTransferDataModel model}) async {
    model.toJson();
    String url = "https://31.220.109.198:8050/CreateVoucher ";

    print('Url : $url');
    print('Data : ${model.toJson()}');
    try {
      // Response response = await dio.post(url, data: model.toJson());
      // print('Response : ${response.data}');
      await dio.post(url, data: model.toJson());
      print('hello');
    } catch (e) {
      print('Error : ${e.toString()}');
      return false;
    }

    return true;
  }
//to get data from json

  Future<DailyEntryFormDataModel> getRecord({String? id}) async {
    String url = "";
    dynamic data = await dio.get(url);
    DailyEntryFormDataModel model = DailyEntryFormDataModel.fromJson(data);

    return model;
  }

//to get whole list of values

  Future<List> getList() async {
    String url = "";
    dynamic data = await dio.get(url);

    return data;
  }
}
