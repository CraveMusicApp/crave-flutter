import 'package:crave/Routing/routing_constants.dart';
import 'package:crave/homePage.dart';
import 'package:crave/main.dart';
import 'package:crave/profile.dart';
import 'package:flutter/material.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => MyLoginPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
