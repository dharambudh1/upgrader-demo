import "package:flutter/material.dart";

class NavigationSingleton {
  factory NavigationSingleton() {
    return _singleton;
  }

  NavigationSingleton._internal();
  static final NavigationSingleton _singleton = NavigationSingleton._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
