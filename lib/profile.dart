import 'package:crave/components/appBar.dart';
import 'package:crave/components/app_drawer.dart';
import 'package:flutter/material.dart' hide Router;
import 'Routing/routing_constants.dart';
import 'package:flutter/cupertino.dart'; //the library for a divider
import 'package:flutter/material.dart';
import 'package:crave/services/auth_service.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}
 

class _ProfilePageState extends State<ProfilePage> {
  AuthService userProfile = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: myAppBar("Profile"),
     drawer: myDrawer(context), 
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.grey[50], Colors.white10])
                      ),
              child: Container(
                width: double.infinity,
                //height: 600.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(userProfile.getProfilePageImage()),
                        radius: 70.0,
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      Text(
                        "Joey117",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 45.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: BorderSide(
                                  color: Color.fromRGBO(0, 160, 227, 1))),
                          onPressed: () {
                            Navigator.pushNamed(context, homeRoute);
                          },
                          padding: EdgeInsets.all(10.0),
                          color: Color(0xff1554F6),
                          textColor: Colors.white,
                          child: Text("Edit Profile",
                              style: TextStyle(fontSize: 15)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Invest in dogecoin. Or else...\n',
                                style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.black,
                                  letterSpacing: 1.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "PLAYLIST",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "FOLLOWERS",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "FOLLOWING",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 100.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[

                            Container(
                              width: 120.0,
                              child: new Image.asset('assets/Blond.jpg'),
                              alignment: Alignment.center,                              
                             margin: EdgeInsets.all(9),
                             padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

                               ),
                            //Container One
                            Container(
                              width: 120.0,
                              child: new Image.asset('assets/alex.jpg'),
                              alignment: Alignment.center,                              
                              margin: EdgeInsets.all(9),//padding: EdgeInsets.only(left: 20, right: 10),
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              

                            ),
                            //Container Two
                            Container(
                              width: 120.0,
                              child: new Image.asset('assets/graduation.jpg'),
                              alignment: Alignment.center,                        
                              margin: EdgeInsets.all(9),
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            ),
                          ],
                        ),
                        //Finish Triple Box
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
