import 'package:crave/homePage.dart';
import 'package:crave/main.dart';
import 'package:crave/profile.dart';
import 'package:crave/services/auth_service.dart';
import 'package:crave/settingsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crave/services/auth_service.dart';

Widget myDrawer(BuildContext context) {
  AuthService userProfile = new AuthService();
  BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.blue[500],
  );
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        // ignore: missing_required_param
        UserAccountsDrawerHeader(
          accountName: Text('Hello, ' + userProfile.getDisplayName(),
              style: TextStyle(
                color: Colors.white,
              )),
          currentAccountPicture:
              ClipOval(child: Image.network(userProfile.getProfileImage())),
          decoration: boxDecoration,
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.blue[500],
          ),
          title: Text('Activity Feed'),
          onTap: () {
            Navigator.push(context,new MaterialPageRoute(builder: (context) => new HomePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.bookmark, color: Colors.blue[500]),
          title: Text('Saved'),
          onTap: () {
            Navigator.push(context,new MaterialPageRoute(builder: (context) => new HomePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.chat_bubble, color: Colors.blue[500]),
          title: Text('Forums'),
          onTap: () {
            Navigator.push(context,new MaterialPageRoute(builder: (context) => new HomePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.account_box_rounded, color: Colors.blue[500]),
          title: Text('Profile'),
          //
          onTap: () {
            Navigator.push(context,new MaterialPageRoute(builder: (context) => new ProfilePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.brightness_low, color: Colors.blue[500]),
          title: Text('Settings'),
          onTap: () {
            Navigator.push(context,new MaterialPageRoute(builder: (context) => new SettingsPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_right_rounded, color: Colors.blue[500]),
          title: Text('Log out'),
          onTap: () {
            Navigator.push(context,new MaterialPageRoute(builder: (context) => new LoginPage()));
          },
        ),
      ],
    ),
  );
}
