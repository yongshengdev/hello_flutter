import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hello_flutter/routes/router_navigator_observer.dart';
import 'package:hello_flutter/ui/route/route_page.dart';
import 'package:hello_flutter/ui/widget/pageview/banner_page.dart';
import 'package:hello_flutter/utils/widget_util.dart';

import 'ui/native_contact/native_contact_page.dart';
import 'ui/riverpod/river_pod_page.dart';

void main() {
  // 所有使用Riverpod的Flutter程序，都必须在widget tree的根部添加ProviderScope，用于储存各个provider
  mainRunApp(const MyApp());
}

Future<void> mainRunApp(Widget child) async {
  // 定义route的名称

  runApp(ProviderScope(child: child));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '首页'),
      navigatorObservers: [RouterNavigatorObserver(), FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          WidgetUtil.generateRow(
              "river pod", () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const RiverPodPage()))}),
          WidgetUtil.generateRow(
              "flutter与原生通信", () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NativeContactPage()))}),
          WidgetUtil.generateRow("路由跳转", () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const RoutePage()))}),
          WidgetUtil.generateRow(
              "PageView", () => {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const BannerPage()))})
        ]));
  }
}
