import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/main.dart';

class RiverPodPage extends ConsumerWidget {
  const RiverPodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("river pod"),
        ),
        body: Stack(children: [
          Container(
              height: 50,
              decoration: const BoxDecoration(color: Colors.green),
              child: Center(child: Consumer(builder: (context, ref, _) {
                // 使用Consumer（ConsumerWidget的封装），控制刷新的范围
                int count = ref.watch(countProvider);
                return Text('$value $count');
              })))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(countProvider.notifier).state++,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
