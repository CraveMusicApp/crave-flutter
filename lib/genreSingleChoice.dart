import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
    );
  }
}

class GenreSingle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final AlertDialog dialog = AlertDialog(
      title: Text('Title'),
      contentPadding: EdgeInsets.zero,
      content: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 1; i <= 3; i++)
            ListTile(
              title: Text(
                'option $i',
              ),
              leading: Radio(
                value: i,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Pop'),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Rap'),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Rock'),
        ),
      ],
    );

    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            showDialog<void>(context: context, builder: (context) => dialog);
          },
          child: Text("Genre"),
        ),
      ),
    );
  }
}

