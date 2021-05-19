import 'package:crave/components/colors.dart';
import 'package:flutter/material.dart';

class AlbumArt extends StatefulWidget {
  final Function(int) callbackAlbum;
  int album_id;
  AlbumArt(this.callbackAlbum, this.album_id);

  @override
  _AlbumArtState createState() => _AlbumArtState();
}

class _AlbumArtState extends State<AlbumArt> {
  // ignore: non_constant_identifier_names
  String album_genre = 'pop_album';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20), child: getAlbumImage()),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: darkPrimaryColor,
              offset: Offset(20, 8),
              spreadRadius: 3,
              blurRadius: 25),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-3, -4),
              spreadRadius: -2,
              blurRadius: 20)
        ],
      ),
    );
  }

  Widget getAlbumImage() {
    var url = 'https://s3-us-west-1.amazonaws.com/crave.albums.com/' +
        album_genre +
        '/' +
        album_genre +
        widget.album_id.toString() +
        '.jpg';
    debugPrint('ALBUM ART.DART: ${widget.album_id.toString()}');
    return Image.network(
      url,
      fit: BoxFit.fill,
    );
  }
}
