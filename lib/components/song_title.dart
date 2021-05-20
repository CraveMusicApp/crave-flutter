import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class MySongTitle extends StatefulWidget {
  @override
  _MySongTitleState createState() => _MySongTitleState();
}

class _MySongTitleState extends State<MySongTitle> {
  Widget build(BuildContext context) {
    return Container(
        height: 68,
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            Text('Another One Bites the Dust', style: TextStyle(fontSize: 25)),
            Text('Queen', style: TextStyle(fontSize: 18, color: Colors.grey))
          ],
        ));
  }
}