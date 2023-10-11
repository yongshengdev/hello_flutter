import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/main.dart';

class RiverPodPage extends StatelessWidget {
  const RiverPodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("river pod"),
        ),
        body: Stack(children: const [RiverPodDemoWidget()]));
  }
}

class RiverPodDemoWidget extends ConsumerWidget {
  const RiverPodDemoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    return Text(value);
  }
}
