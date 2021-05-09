import 'package:crave/components/colors.dart';
import 'package:flutter/material.dart';

class AlbumArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 260,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/Dababy_BabyOnBaby.jpg',fit: BoxFit.fill,)),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: darkPrimaryColor,
              offset: Offset(20,8),
              spreadRadius: 3,
              blurRadius: 25
          ),
          BoxShadow(color: Colors.white,offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20
          )
        ],

      ),

    );
  }
}