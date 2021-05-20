import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class MySongSlider extends StatefulWidget {
  final Function(int) callbackAlbum;
  final Function(bool) callbackLike;
  int album_id;
  bool liked = false;
  MySongSlider(this.callbackAlbum, this.album_id, this.callbackLike,this.liked);

  @override
  _MySongSliderState createState() => _MySongSliderState();
}

class _MySongSliderState extends State<MySongSlider> {
  AudioPlayer audioPlayer = new AudioPlayer();
  //Duration duration = new Duration();
  Duration position = new Duration();
  //Create an instance
  final player = AudioPlayer();
  bool playing = false;
  int song_id = 1;

  String getUrl() {
    var url = 'https://s3-us-west-1.amazonaws.com/crave.songs.com/' +
        'pop' +
        '/' +
        'pop' +
        song_id.toString() +
        '.mp3';
    debugPrint('\n\nurl $url');
    return url;
  }

  void setSongId() {
    setState(() {
      this.song_id++;
    });
  }

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
    await player.setUrl(getUrl());

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
    setSongId();
    if (widget.liked == true) {
      changeLike();
    }
    widget.callbackAlbum(widget.album_id);
    debugPrint('callback album_id: ${widget.album_id}');

    await player.setUrl(getUrl());
  }

  void changeLike() {
    widget.callbackLike(widget.liked);
  }
}
