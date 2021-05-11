import 'package:flutter/material.dart';

class MySongTools extends StatefulWidget {
  @override
  _MySongToolsState createState() => _MySongToolsState();
}

class _MySongToolsState extends State<MySongTools> {
  bool liked = false;
  bool skip = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                getNext();
              },
              child: Icon(
                skip == false 
                  ? Icons.skip_next_outlined 
                  : Icons.skip_next,
                size: 50,
                color: Colors.lightGreen,
              )),
          InkWell(
              onTap: () {
                getLike();
              },
              child: Icon(
                liked == false
                    ? Icons.thumb_up_outlined
                    : Icons.thumb_up_rounded,
                size: 40,
                color: Colors.lightGreen,
              ))
        ],
      ),
    );
  }

  void getLike() {
    if (liked) {
      setState(() {
        liked = false;
      });
    } else {
      setState(() {
        liked = true;
      });
    }
    debugPrint('Status of Liked: $liked');
  }

  void getNext() {
    if (skip) {
      setState(() {
        skip = false;
      });
    } else {
      setState(() {
        skip = true;
      });
    }
    debugPrint('Status of Skip: $skip');
  }
}
