import 'package:crave/components/popup/dialog.dart';
import 'package:flutter/material.dart' hide Router;

Widget myAppBar(String title, BuildContext context) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.grey[50],
    iconTheme: IconThemeData(color: Colors.black),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.music_note_outlined),
        tooltip: 'Open Music Selection',
        color: Colors.black,
        iconSize: 30,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogPopup();
              });
        },
      ),
    ],
  );
}
