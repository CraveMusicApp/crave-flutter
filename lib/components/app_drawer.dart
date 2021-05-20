import 'package:crave/genreHomePageSelect.dart';
import 'package:crave/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crave/Routing/routing_constants.dart';
import 'package:crave/services/auth_service.dart';


Widget myDrawer(BuildContext context){
AuthService userProfile = new AuthService();
  BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.white,
    );
   return Drawer(
      child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // ignore: missing_required_param
            UserAccountsDrawerHeader(
            //  accountName: Text('Hello, ' + userProfile.getDisplayName(), style: TextStyle(color: Colors.black, )),
             // currentAccountPicture:
            //  Image.network(userProfile.getProfileImage()),
              decoration: boxDecoration,
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Activity Feed'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Saved'),
              onTap: () {
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
                Navigator.pushNamed(context,loginRoute);
              },
            ),
          ],
        ),
        
    );
    
}