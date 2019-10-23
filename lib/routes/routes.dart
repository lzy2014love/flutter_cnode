import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cnode/pages/home.dart';
import 'package:flutter_cnode/utils/global.dart';

typedef RouteBuilderByArguments = Route<dynamic> Function(Object arguments);

class RouteName {
  static const String login = '/login';
  static const String home = '/';
  static const String welcome = '/welcome';
}

class Routes {
  /// 路由构建
  static Route routeBuilder(Widget widget) {
    return CupertinoPageRoute(builder: (context) => pageContainer(widget));
  }

  static final routes = <String, RouteBuilderByArguments>{
    RouteName.home: (arguments) => routeBuilder(HomePage()),
    RouteName.login: (arguments) => routeBuilder(Container()),
  };
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final arguments = settings.arguments;
    final routeBuilderByArguments = routes[routeName];
    assert(routeBuilderByArguments != null, '路由404');
    return routeBuilderByArguments(arguments);
  }

  static NavigatorState get rootNavigator {
    return Global.rootNavigator;
  }

  /// 通用跳转
  static Future<T> gotoPage<T>(String routeName,
      {bool replace = false, Object arguments}) {
    return replace
        ? rootNavigator.pushReplacementNamed<T, void>(routeName,
            arguments: arguments)
        : rootNavigator.pushNamed<T>(routeName, arguments: arguments);
  }

  /// Page页面的容器，做一次通用自定义
  static MediaQuery pageContainer(Widget widget) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: widget,
    );
  }

  static Future<void> goLogin({bool replace = false}) {
    return gotoPage<void>(RouteName.login, replace: replace);
  }
}
