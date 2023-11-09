import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hello_flutter/utils/widget_util.dart';

class MethodChannelPage extends StatefulWidget {
  const MethodChannelPage({super.key});

  @override
  State<StatefulWidget> createState() => _MethodChannelState();
}

class _MethodChannelState extends State<MethodChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("method channel")),
        body: Column(children: [
          WidgetUtil.generateRow("flutter调用原生", () {
            SmartDialog.showToast("flutter调用原生");
          }),
          WidgetUtil.generateRow("原生调用flutter", () {
            SmartDialog.showToast("原生调用flutter");
          }),
        ]));
  }
}
