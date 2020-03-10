import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'authPages.dart';

class WelcomeMenu extends StatefulWidget {
  @override
  _WelcomeMenuState createState() => _WelcomeMenuState();
}

class _WelcomeMenuState extends State<WelcomeMenu> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: pages,
      enableLoop: false,
      fullTransitionValue: 400,
      enableSlideIcon: true,
      slideIconWidget: Icon(Icons.arrow_left),
      waveType: WaveType.liquidReveal,
    );
  }
}