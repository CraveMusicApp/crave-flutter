import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MySongSlider extends StatefulWidget {
  @override
  _MySongSliderState createState() => _MySongSliderState();
}

class _MySongSliderState extends State<MySongSlider> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
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
        value: duration.inSeconds.toDouble(),
        max: duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {});
        });
  }

  Future<void> getAudio() async {
    var url = "";
    if (playing) {
      //pause song
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      //play song
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
