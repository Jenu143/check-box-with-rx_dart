import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rx_dart_demo/constant/strings.dart';
import 'package:rx_dart_demo/model/custom_modal.dart';
import 'package:rx_dart_demo/model/data_model.dart';

class GetApi {
  Future<CustomModal<DataModel>> getApi() async {
    final response = await http.get(Uri.parse(Strings.url));

    if (response.statusCode == 200) {
      return CustomModal<DataModel>(
        data: DataModel.fromJson(jsonDecode(response.body)),
      );
    } else {
      return CustomModal<DataModel>(status: 400);
    }
  }
}
