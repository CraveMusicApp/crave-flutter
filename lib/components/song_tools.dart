import 'package:flutter/material.dart';

class MySongTools extends StatefulWidget {
  final Function(bool) callbackLike;
  final Function(bool) callbackSkip;
  bool liked;
  bool skip;
  MySongTools(this.callbackLike, this.liked, this.callbackSkip, this.skip);

  @override
  _MySongToolsState createState() => _MySongToolsState();
}

class _MySongToolsState extends State<MySongTools> {
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
                widget.skip == false
                    ? Icons.skip_next_outlined
                    : Icons.skip_next,
                size: 50,
                color: Colors.blue[500],
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
                color: Colors.blue[500],
              ))
        ],
      ),
    );
  }

  void getLike() {
    widget.callbackLike(widget.liked);
  }

  void getNext() {
    widget.callbackSkip(widget.skip);
  }
}
