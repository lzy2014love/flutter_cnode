import 'package:flutter/material.dart';

class Global {
  Global._();

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get rootNavigator {
    return rootNavigatorKey.currentState;
  }

  static String accesstoken = '';
}
