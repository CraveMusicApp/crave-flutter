//import 'dart:html';
import 'package:crave/genreHomePageSelect.dart';
import 'package:flutter/material.dart' hide Router;

Widget myAppBar(String title) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.grey[50],
    iconTheme: IconThemeData(color: Colors.black),
    actions: <Widget>[
    GenreAlert(),
    ],

  );
}
