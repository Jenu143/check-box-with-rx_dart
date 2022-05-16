import 'package:rx_dart_demo/model/data_model.dart';

class CustomModal<T> {
  int? status;
  T? data;
  CustomModal({
    this.status,
    this.data,
  });
  CustomModal.fromJson(Map<String,dynamic> json) {
    status = json["status"];
    data = json["data"];
  }
}
