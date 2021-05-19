import 'package:crave/components/audio_player.dart';
import 'package:crave/components/appBar.dart';
import 'package:flutter/material.dart' hide Router;
import 'Routing/routing.dart';
import 'components/appBar.dart';
import 'components/app_drawer.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomePageState(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}
class _HomePageState extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:myAppBar("Homepage"),  
      drawer: myDrawer(context),
      body: Center(child: Audio())
    );
  }
}