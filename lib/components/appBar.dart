//import 'dart:html';

import 'package:flutter/material.dart' hide Router;
import '../Routing/routing.dart';
import '../Routing/routing_constants.dart';

Widget myAppBar(String title){
   return AppBar(
      elevation: 0.0,
        backgroundColor: Colors.grey[50],
        iconTheme: IconThemeData(color: Colors.black),
   );
}

