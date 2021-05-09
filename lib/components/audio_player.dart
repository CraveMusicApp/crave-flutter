import 'package:crave/components/album_art.dart';
import 'package:crave/components/song_slider.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';

class MyAudio extends StatefulWidget {
  @override
  _MyAudioState createState() => _MyAudioState();
}

class _MyAudioState extends State<MyAudio> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AlbumArt(),
          MySongSlider(),
        ],
      ),
    );
  }
}
