import 'package:flutter/material.dart';
import 'package:the_strange_chat/auth/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'theSTRANGEchat',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Color(0xff2e9459),
        accentColor: Color(0xff9a2d37),
        backgroundColor: Color(0xff454545)
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LogIn()
      )
    );
  }
}
