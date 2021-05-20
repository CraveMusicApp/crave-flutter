import 'package:crave/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenreAlert extends StatefulWidget {
  @override
  _GenreAlertState createState() => _GenreAlertState();
}

class _GenreAlertState extends State<GenreAlert> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked0 = false; //pop
          bool isChecked1 = false; //rap
          bool isChecked2 = false; //country

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pop"),
                          Checkbox(
                              value: isChecked0,
                              onChanged: (checked) {
                                if (isChecked0 = true) {
                                  isChecked1 = false;
                                  isChecked2 = false;
                                } else {}
                                setState(() {
                                  isChecked0 = checked;
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rap"),
                          Checkbox(
                              value: isChecked1,
                              onChanged: (checked) {
                                if (isChecked1 = true) {
                                  isChecked0 = false;
                                  isChecked2 = false;
                                } else {}
                                setState(() {
                                  isChecked1 = checked;
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Country"),
                          Checkbox(
                              value: isChecked2,
                              onChanged: (checked) {
                                if (isChecked2 = true) {
                                  isChecked0 = false;
                                  isChecked1 = false;
                                } else {}
                                setState(() {
                                  isChecked2 = checked;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              title: Text('Choose Genre'),
              actions: <Widget>[
                InkWell(
                  child: Text('Done   '),
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop(HomePage());
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.topRight,
      child: Ink(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: const Icon(Icons.add_to_photos_rounded),
          color: Colors.black,
          onPressed: () async {
            await showInformationDialog(context);
          },
        ),
      ),
    ));
  }
}
