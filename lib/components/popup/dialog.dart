import 'package:flutter/material.dart';

class DialogPopup extends StatefulWidget {
  final Function(String) callbackGenre;
  String _genreGroupValue;
  DialogPopup(this.callbackGenre, this._genreGroupValue);
  @override
  _DialogPopupState createState() => _DialogPopupState();
}

class _DialogPopupState extends State<DialogPopup> {
  var genreArr = ['pop', 'rock', 'country'];
  

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        backgroundColor: Colors.blue[500],
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      'Select Genre',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: genreArr[0],
                              groupValue: widget._genreGroupValue,
                              onChanged: (val) {
                                widget._genreGroupValue = val;
                                setState(() {
                                  widget.callbackGenre(val);
                                });
                              },
                              activeColor: Colors.white,
                            ),
                            Text(genreArr[0],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ]),
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                                groupValue: widget._genreGroupValue,
                                value: genreArr[1],
                                activeColor: Colors.white,
                                onChanged: (val) {
                                  widget._genreGroupValue = val;
                                  setState(() {
                                    widget.callbackGenre(val);
                                  });
                                }),
                            Text(genreArr[1],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ]),
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                                groupValue: widget._genreGroupValue,
                                value: genreArr[2],
                                activeColor: Colors.white,
                                onChanged: (val) {
                                  widget._genreGroupValue = val;
                                  setState(() {
                                    widget.callbackGenre(val);
                                  });
                                }),
                            Text(genreArr[2],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.white,
                      child: Text(
                        'Okay',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -50,
                child: ClipOval(
                  child:
                      Image.asset("assets/music.gif", height: 100, width: 130),
                )),
          ],
        ));
  }
}
