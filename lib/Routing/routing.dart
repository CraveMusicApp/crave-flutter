import 'package:crave/Routing/routing_constants.dart';
import 'package:crave/homePage.dart';
import 'package:crave/main.dart';
import 'package:crave/settingsPage.dart';
import 'package:flutter/material.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => MyLoginPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
