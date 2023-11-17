import 'package:flutter/cupertino.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < 6; i++) {
      children.add(_BannerPageWidget(i.toString()));
    }
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: PageView(
        scrollDirection: Axis.horizontal,
        allowImplicitScrolling: true, // 预加载前后一页
        children: children,
      ),
    );
  }
}

class _BannerPageWidget extends StatefulWidget {
  final String _text;

  const _BannerPageWidget(this._text);

  @override
  State<StatefulWidget> createState() => _BannerPageWidgetState();
}

class _BannerPageWidgetState extends State<_BannerPageWidget> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    // 必须调用
    super.build(context);
    debugPrint("build ${widget._text}");
    return Center(child: Text(widget._text, textScaleFactor: 5));
  }

  @override
  bool get wantKeepAlive => true; // 需要缓存
}
