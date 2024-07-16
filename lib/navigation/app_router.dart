import 'package:flutter/material.dart';
import 'package:gatherly/presentation/screens/home/home_screen.dart';

import '../presentation/screens/splash/splash_screen.dart';
import 'app_route_paths.dart';

class AppRouter {
  AppRouter._internal();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splashRoute:
        return buildPageRoute(const SplashScreen(), settings);
        case RoutePaths.homeRoute:
        return buildPageRoute(const HomeScreen(), settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  static MaterialPageRoute buildPageRoute(
      Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }

  static String get initialRoute => RoutePaths.splashRoute;
}
