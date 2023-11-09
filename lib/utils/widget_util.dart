import 'package:flutter/material.dart';
import 'package:hello_flutter/res/resources.dart';

class WidgetUtil {
  /// 生成一行
  static Widget generateRow(String text, GestureTapCallback onTap) {
    return GestureDetector(
        onTap: onTap,
        child: Column(children: [
          Container(padding: const EdgeInsets.all(15), child: Text(text)),
          Container(height: 1, decoration: const BoxDecoration(color: Resources.divider))
        ]));
  }
}
