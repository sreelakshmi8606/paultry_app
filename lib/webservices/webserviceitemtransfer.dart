import 'package:dio/dio.dart';
import 'package:e_comm/data_models/transactions/item_transfer.dart';


class WebserviceItemTransfer {
  Dio dio = Dio();

//to put data to json/save to cloud

  Future<bool> saveRecord({required ItemTransferDataModel model}) async {
    model.toJson();
    String url = " ";

    try {
      Response response = await dio.post(url, data: model.toJson());
      print('Response : ${response.data}');
    } catch (e) {
      return false;
    }

    return true;
  }

//to get data from json

  Future<ItemTransferDataModel> getRecord({String? id}) async {
    String url = "";
    dynamic data = await dio.get(url);
  ItemTransferDataModel model = ItemTransferDataModel.fromJson(data);

    return model;
  }

//to get whole list of values

  Future<List> getList() async {
    String url = "";
    dynamic data = await dio.get(url);

    return data;
  }
}
