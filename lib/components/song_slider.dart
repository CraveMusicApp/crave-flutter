import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MySongSlider extends StatefulWidget {
  @override
  _MySongSliderState createState() => _MySongSliderState();
}

class _MySongSliderState extends State<MySongSlider> {
  AudioPlayer audioPlayer = new AudioPlayer();
  //Duration duration = new Duration();
  Duration position = new Duration();
  //Create an instance
  final player = AudioPlayer();
  // ignore: non_constant_identifier_names
  var song_genre = 'pop';
  // ignore: non_constant_identifier_names
  var song_id = 1;

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          slider(),
          InkWell(
              onTap: () {
                getAudio();
              },
              child: Icon(
                playing == false
                    ? Icons.play_circle_outline
                    : Icons.pause_circle_outline,
                size: 100,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
        min: 0.0,
        value: position.inSeconds.toDouble(),
        max: 30.0,
        onChanged: (double value) {
          setState(() {
            player.seek(Duration(seconds: value.toInt()));
          });
        });
  }

  Future<void> getAudio() async {
    var url = 'https://s3-us-west-1.amazonaws.com/crave.songs.com/' +
        song_genre +
        '/' +
        song_genre +
        song_id.toString() +
        '.mp3';

    var response = await player.setUrl(url);

    if (playing) {
      player.pause();
      setState(() {
        playing = false;
        debugPrint('Player Paused.\n playing= $playing');
      });
    } else {
      player.play();
      setState(() {
        playing = true;
        debugPrint('Player Resumed.\n playing= $playing');
      });
    }

    player.positionStream.listen((Duration dd) {
      print('Duration: $dd');
      setState(() {
        position = dd;
        if (position.inSeconds.toDouble() >= 30.0) {
          nextSong();
        }
      });
    });
  }

  void nextSong() async {
    position = new Duration();
    song_id += 1;
    var url = 'https://s3-us-west-1.amazonaws.com/crave.songs.com/' +
        song_genre +
        '/' +
        song_genre +
        song_id.toString() +
        '.mp3';

    var response = await player.setUrl(url);
  }
}
