import 'package:flutter/material.dart';

class MySongTools extends StatefulWidget {
  Function(bool) callbackLike;
  bool liked;
  MySongTools(this.callbackLike, this.liked);
  
  @override
  _MySongToolsState createState() => _MySongToolsState();
}

class _MySongToolsState extends State<MySongTools> {
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
                skip == false ? Icons.skip_next_outlined : Icons.skip_next,
                size: 50,
                color: Colors.white,
              )),
          InkWell(
              onTap: () {
                getLike();
              },
              child: Icon(
                widget.liked == false
                    ? Icons.thumb_up_outlined
                    : Icons.thumb_up_rounded,
                size: 40,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  void getLike() {
    widget.callbackLike(widget.liked);
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
