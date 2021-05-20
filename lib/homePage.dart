import 'package:crave/components/audio_player.dart';
import 'package:crave/components/appBar.dart';
import 'package:flutter/material.dart' hide Router;
import 'Routing/routing.dart';
import 'components/appBar.dart';
import 'components/app_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String songGenre;

  //callbacks
  void changeSongGenre(String songGenre) {
    setState(() {
      this.songGenre = songGenre;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
        home: Scaffold(
            appBar: myAppBar(
                "Homepage", context, this.changeSongGenre, this.songGenre),
            drawer: myDrawer(context),
            body: Center(child: Audio(this.songGenre))));
  }
}
