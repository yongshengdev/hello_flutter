import 'package:flutter/material.dart';
import 'package:hello_flutter/utils/widget_util.dart';

import 'method_channel_page.dart';

class NativeContactPage extends StatefulWidget {

  const NativeContactPage({super.key});

  @override
  State<StatefulWidget> createState() => _NativeContactPage();
}

class _NativeContactPage extends State<NativeContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("flutter与原生通信")),
        body: Column(
            children: [
              WidgetUtil.generateRow("method channel", () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const MethodChannelPage()));
              })
            ]
        )
    );
  }
}