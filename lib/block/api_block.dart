import 'package:flutter/cupertino.dart';
import 'package:rx_dart_demo/api/api_calling.dart';
import 'package:rx_dart_demo/model/custom_modal.dart';
import 'package:rx_dart_demo/model/data_model.dart';
import 'package:rxdart/rxdart.dart';

class ApiBlock {
  GetApi getApi = GetApi();

  // bool checked = false;

  final streamController = PublishSubject<CustomModal<DataModel>>();

  Stream<CustomModal<DataModel>> get apiStream => streamController.stream;

  Future<CustomModal<DataModel>> sink() async {
    CustomModal<DataModel> res = await getApi.getApi();
    streamController.sink.add(res);
    return res;
  }

  final streamcheckController = PublishSubject<bool>();

  Stream<bool> get checkStream => streamcheckController.stream;

  void checkValueSink(bool a) {
    streamcheckController.sink.add(a);
  }
}
