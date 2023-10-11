import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_flutter/main.dart';

/// 学习博客：https://blog.csdn.net/qq_17766199/article/details/128032642
/// 官网地址：https://riverpod.dev/docs/getting_started
class RiverPodPage extends ConsumerWidget {
  const RiverPodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("river pod"),
        ),
        body: Column(children: [
          Container(
              height: 50,
              decoration: const BoxDecoration(color: Colors.green),
              child: Center(child: Consumer(builder: (context, ref, _) {
                // 使用Consumer（ConsumerWidget的封装），控制刷新的范围
                int count = ref.watch(countProvider);
                return Text('$value $count');
              }))),
          Container(
              height: 50,
              decoration: const BoxDecoration(color: Colors.yellow),
              child: Consumer(builder: (context, ref, _) {
                AsyncValue<String> futureProviderValue = ref.watch(futureProvider);
                return futureProviderValue.when(
                  data: (data) => Text("future value: $data"),
                  error: (err, stack) => const Text('Oops, something unexpected happened'),
                  loading: () => const CircularProgressIndicator(),
                );
              }))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(countProvider.notifier).state++,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
