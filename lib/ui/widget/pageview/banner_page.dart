import 'package:flutter/material.dart';

import 'banner_widget.dart';


// Page
class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("PageView")), body: Column(children: const [BannerWidget()]));
  }
}
