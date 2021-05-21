import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ActiveFeed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ActivityFeed();
  }
}

class _ActivityFeed extends State<ActiveFeed> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Activity'),
      ),
      body: FutureBuilder<List>(
        future: getAllRecords(),
        initialData: List(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, int position) {
                    final item = snapshot.data[position];
                    //get your item data here ...
                    return Card(
                      child: ListTile(
                        title: Text(
                            "Employee Name: " + snapshot.data[position].row[1]),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
  Future<List> getAllRecords() async {
    
}

}
