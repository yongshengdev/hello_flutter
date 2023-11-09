import 'package:flutter/material.dart';

class RouterNavigatorObserver extends NavigatorObserver {
  static final List<String> _pages = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint("RouterNavigatorObserver.didPush:${route.settings.name}--${previousRoute?.settings.name}");
    _addRoute(route);
    debugPrint("RouterNavigatorObserver.didPush:_pages=$_pages");
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint("RouterNavigatorObserver.didPop:${route.settings.name}--${previousRoute?.settings.name}");
    _removeRoute(route);
    debugPrint("RouterNavigatorObserver.didPop:_pages=$_pages");
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    debugPrint("RouterNavigatorObserver.didRemove:${route.settings.name}--${previousRoute?.settings.name}");
    _removeRoute(route);
    debugPrint("RouterNavigatorObserver.didRemove:_pages=$_pages");
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint("RouterNavigatorObserver.didReplace:${newRoute?.settings.name}--${oldRoute?.settings.name}");
    _addRoute(newRoute);
    debugPrint("RouterNavigatorObserver.didReplace:_pages=$_pages");
  }

  void _addRoute(Route? route) {
    if (route != null && route.settings.name != null && route.settings.name!.isNotEmpty) {
      _pages.add(route.settings.name!);
    }
  }

  void _removeRoute(Route? route) {
    if (route != null && route.settings.name != null && route.settings.name!.isNotEmpty) {
      _pages.remove(route.settings.name!);
    }
  }
}
