import 'package:flutter/material.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'authPages.dart';

class WelcomeMenu extends StatefulWidget {
  WelcomeMenu(BuildContext context);

  @override
  _WelcomeMenuState createState() => _WelcomeMenuState();
}

class _WelcomeMenuState extends State<WelcomeMenu> {
  @override
  Widget build(BuildContext thisContext) {
    return LiquidSwipe(
      pages: pages,
      enableLoop: false,
      fullTransitionValue: 400,
      enableSlideIcon: false,
      slideIconWidget: Icon(Icons.arrow_left),
      waveType: WaveType.circularReveal,
    );
  }
}

