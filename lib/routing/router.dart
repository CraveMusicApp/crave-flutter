import 'package:crave/home.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import './routing_constant.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case myHomeRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
