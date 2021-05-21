import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

// ignore: must_be_immutable
class MySongSlider extends StatefulWidget {
  final Function(int) callbackAlbum;
  final Function(bool) callbackLike;
  final Function(bool) callbackSkip;
  int album_id;
  bool liked = false;
  bool skip = false;
  String songGenre;
  MySongSlider(this.callbackAlbum, this.album_id, this.callbackLike, this.liked,
      this.callbackSkip, this.skip, this.songGenre);

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
    debugPrint('\nSongGenre on slider: ${widget.songGenre}');
    var url = 'https://s3-us-west-1.amazonaws.com/crave.songs.com/' +
        widget.songGenre +
        '/' +
        widget.songGenre +
        song_id.toString() +
        '.mp3';

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
      height: 200,
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
                  color: playing == false ? Colors.blue[500] : Colors.red))
        ],
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
        min: 0.0,
        value: position.inSeconds.toDouble(),
        max: 30.0,
        activeColor: Colors.blue[500],
        inactiveColor: Colors.green,
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
        if (position.inSeconds.toDouble() >= 30.0 || widget.skip == true) {
          nextSong();
        }
      });
    });
  }

  void nextSong() async {
    position = new Duration();
    debugPrint('\n\nset Song ID');
    setSongId();
    if (widget.liked == true) {
      changeLike();
    }
    if (widget.skip == true) {
      changeSkip();
      widget.skip = false;
    }
    widget.callbackAlbum(widget.album_id);
    debugPrint('callback album_id: ${widget.album_id}');
    await player.setUrl(getUrl());
  }

  void changeLike() {
    widget.callbackLike(widget.liked);
  }

  void changeSkip() {
    widget.callbackSkip(widget.skip);
  }
}
