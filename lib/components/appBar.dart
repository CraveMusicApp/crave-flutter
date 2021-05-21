import 'package:crave/components/popup/dialog.dart';
import 'package:flutter/material.dart' hide Router;

Widget myAppBar(String title, BuildContext context,
    Function(String) callbackGenre, String songGenre) {
  void pressButton() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogPopup(callbackGenre, songGenre);
        });
  }
  

  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.blue[500],
    iconTheme: IconThemeData(color: Colors.white),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.music_note_outlined),
        tooltip: 'Open Music Selection',
        color: Colors.white,
        iconSize: 30,
        onPressed: () {
          pressButton();
        },
      ),
    ],
  );
}
