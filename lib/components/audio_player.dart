import 'package:crave/components/album_art.dart';
import 'package:crave/components/song_slider.dart';
import 'package:crave/components/song_tools.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Audio extends StatelessWidget {
  final VoidCallback onAudioSelected;
  // ignore: non_constant_identifier_names
  var song_id = 1;
  

  Audio(
      // ignore: non_constant_identifier_names
      {@required this.song_id,
      @required this.album_id,
      this.onAudioSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [AlbumArt(), MySongSlider(), MySongTools()],
      ),
    );
  }
}
