import 'package:flutter/material.dart' hide Router;
import 'Routing/routing.dart';
import 'Routing/routing_constants.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:crave/blocs/auth_bloc.dart';
import 'package:crave/screens/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPage());

}

class LoginPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}