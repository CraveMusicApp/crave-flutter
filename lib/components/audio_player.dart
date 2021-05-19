import 'package:crave/components/album_art.dart';
import 'package:crave/components/song_slider.dart';
import 'package:crave/components/song_tools.dart';
import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  //final Function(String) callbackGenre;
  //String song_genre;
  Audio();

  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  int album_id = 1;

  String song_genre = 'pop';


  void changeAlbum(int album_id) {
    this.setState(() {
      this.album_id = ++album_id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AlbumArt(this.changeAlbum, this.album_id),
          MySongSlider(this.changeAlbum, this.album_id),
          MySongTools()
        ],
      ),
    );
  }
}
