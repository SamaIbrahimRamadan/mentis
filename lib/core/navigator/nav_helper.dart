import 'package:flutter/material.dart';

import 'named_navigator_impl.dart';

class Nav {
  static void replace(Widget widget) {
    NamedNavigatorImpl.navigatorState.currentState!
        .pushReplacement(MaterialPageRoute(builder: (ctx) => widget));
  }

  static void to(Widget widget) {
    NamedNavigatorImpl.navigatorState.currentState!
        .push(MaterialPageRoute(builder: (ctx) => widget));
  }

  static void pop() => NamedNavigatorImpl.navigatorState.currentState!.pop();

  static void push(Widget widget) {
    NamedNavigatorImpl.navigatorState.currentState!
        .push(MaterialPageRoute(builder: (ctx) => widget));
  }

  static void replaceAll(Widget widget) {
    NamedNavigatorImpl.navigatorState.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  }
}
