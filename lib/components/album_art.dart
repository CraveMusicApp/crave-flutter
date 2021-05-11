import 'package:crave/components/colors.dart';
import 'package:flutter/material.dart';

class AlbumArt extends StatelessWidget {
  // ignore: non_constant_identifier_names
  var album_genre = 'pop_album';
  // ignore: non_constant_identifier_names
  var album_id = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            getAlbumUrl(),
            fit: BoxFit.fill,
          )),
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

  String getAlbumUrl() {
    var url = 'https://s3-us-west-1.amazonaws.com/crave.albums.com/' +
        album_genre +
        '/' +
        album_genre +
        album_id.toString() +
        '.jpg';
    return url;
  }
  void incrementAlbumId() {
  album_id += 1;
}
}


