import 'package:flutter/material.dart';
import 'package:rx_dart_demo/block/api_block.dart';
import 'package:rx_dart_demo/model/custom_modal.dart';
import 'package:rx_dart_demo/model/data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiBlock apiBlock = ApiBlock();
  bool checked = false;
  @override
  void initState() {
    apiBlock.sink();
    apiBlock.checkValueSink;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<CustomModal<DataModel>>(
        stream: apiBlock.apiStream,
        builder: (context, snapshot) {
          if (snapshot.hasData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final nData = snapshot.data?.data?.data;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${nData?.playGame?[0].appUrl}"),
                  StreamBuilder<bool>(
                    stream: apiBlock.checkStream,
                    builder: (context, data) {
                      return Column(
                        children: [
                          Checkbox(
                            value: data.data ?? false,
                            onChanged: (check) {
                              checked = !checked;
                              apiBlock.checkValueSink(checked);
                            },
                          ),
                          Text("${data.data}"),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
