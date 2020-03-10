import 'package:flutter/material.dart';
import 'package:the_strange_chat/auth/welcomeMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'theSTRANGEchat',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Color.fromRGBO(20, 78, 45, 1),
        accentColor: Color.fromRGBO(92, 31, 37, 1),
        backgroundColor: Color.fromRGBO(20, 20, 20, 1)
      ),
      home: WelcomeMenu()
    );
  }
}
