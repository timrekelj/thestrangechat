import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


final pages = [

  //First page
  Container(
    decoration: BoxDecoration(
        color: Color.fromRGBO(20, 20, 20, 1)
    ),
    child: Column(
      children: <Widget>[
        Image.asset('assets/images/ChatLogo.png'),
        SizedBox(height: 70,),
        FlatButton(
          color: Color(0xff9a2d37),
          child: Text(
            'Swipe right to log in',
            style: TextStyle(
              fontFamily: 'Roboto Bold',
              fontSize: 20,
              color: Color(0xff2e9459)
            )
          ), onPressed: () {},
        )
      ],
    ),
  ),

  //Login page
  Container(
    decoration: BoxDecoration(
        color: Color.fromRGBO(20, 20, 20, 1)
    ),
    child: Form(
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/ChatLogo.png'),
        ],
      )
    ),
  ),

  //Signup page
  Container(
    decoration: BoxDecoration(
        color: Color.fromRGBO(20, 20, 20, 1)
    ),
    child: Column(
      children: <Widget>[
        Image.asset('assets/images/ChatLogo.png'),
      ],
    ),
  )
];