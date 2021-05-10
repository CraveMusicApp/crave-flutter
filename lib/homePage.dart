import 'package:crave/components/appBar.dart';
import 'package:flutter/material.dart' hide Router;
import 'Routing/routing.dart';
import 'Routing/routing_constants.dart';
import 'components/appBar.dart';
import 'components/app_drawer.dart';
import 'blocs/auth_bloc.dart';
import 'services/auth_service.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: _HomePageState(),
       onGenerateRoute: Router.generateRoute,
    );
  }
}
class _HomePageState extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.white,
    );

    return Scaffold(

     appBar:myAppBar("Homepage"),  
    drawer: myDrawer(context),

    );
  }
}
