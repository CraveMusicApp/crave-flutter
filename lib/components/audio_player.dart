import 'package:crave/components/album_art.dart';
import 'package:crave/components/song_slider.dart';
import 'package:crave/components/song_title.dart';
import 'package:crave/components/song_tools.dart';
import 'package:crave/flask/api.dart';
import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  String song_genre;
  Audio(this.song_genre);
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  int album_id = 1;
  bool skipSong = false;
  bool likeSong = false;

  //callbacks
  void changeAlbum(int album_id) {
    this.setState(() {
      this.album_id = ++album_id;
    });
  }

  void changeSkip(bool skipSong) {
    this.setState(() {
      if (skipSong == true) {
        this.skipSong = false;
      } else {
        this.skipSong = true;
      }
    });
  }

  void changeLike(bool likeSong) async {
    this.setState(() {
      if (likeSong == true) {
        this.likeSong = false;
      } else {
        this.likeSong = true;
      }
    });
    songInfoRequest(this.likeSong, album_id.toString(), song_genre);
    debugPrint('Status of Liked: ${likeSong}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.blue[500],
            Colors.grey[900],
            Colors.black,
            Colors.black,
            Colors.black
          ])),
      child: Column(
        children: [
          AlbumArt(this.changeAlbum, this.album_id,widget.song_genre),
          MySongTitle(),
          MySongSlider(this.changeAlbum, this.album_id, this.changeLike,
              this.likeSong, this.changeSkip, this.skipSong, widget.song_genre),
          MySongTools(
              this.changeLike, this.likeSong, this.changeSkip, this.likeSong)
        ],
      ),
    );
  }
}
