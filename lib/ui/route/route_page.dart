import 'package:flutter/material.dart';

import '../../utils/widget_util.dart';

// 路由跳转
class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<StatefulWidget> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("路由跳转")),
        body: Column(
          children: [
            WidgetUtil.generateRow("push", () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const RoutePage()));
            }),
            WidgetUtil.generateRow("pop", () {
              Navigator.pop(context);
            }),
            WidgetUtil.generateRow("remove", () {
              Navigator.removeRoute(context, MaterialPageRoute(builder: (BuildContext context) => const RoutePage()));
            }),
            WidgetUtil.generateRow("replace", () {
              // Navigator.replace(context);
            }),
          ]
        ));
  }
}
