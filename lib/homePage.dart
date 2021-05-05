import 'package:crave/components/audio_player.dart';
import 'package:flutter/material.dart' hide Router;
import 'Routing/routing.dart';
import 'Routing/routing_constants.dart';

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
    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.white,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // ignore: missing_required_param
            UserAccountsDrawerHeader(
              accountName: Text('Joey'),
              currentAccountPicture:
                  Image.network('https://i.imgur.com/t0MRiAf.png'),
              decoration: boxDecoration,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Activity Feed'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Saved'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble),
              title: Text('Forums'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text('Profile'),
              //
              onTap: () {
                Navigator.pushNamed(context, profileRoute);
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_low),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, settingsRoute);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_right_rounded),
              title: Text('Log out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: MyAudio()
        ),
    );
  }
}
