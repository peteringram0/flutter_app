import 'package:flutter/material.dart';
import 'package:flutter_app/camera.dart';
import 'package:flutter_app/plannet_animation.dart';
import 'dart:io';

class MainArea extends StatefulWidget {
  @override
  MainAreaState createState() => MainAreaState();
}

enum PAGES { CAMERA, DASHBOARD, INFO }

class MainAreaState extends State<MainArea> {
  PAGES page = PAGES.DASHBOARD;

  @override
  void initState() {
    super.initState();
    // sleep(const Duration(seconds: 3));
    // updatePage(PAGES.INFO);
    // sleep(const Duration(seconds:3));
  }

  void updatePage(PAGES a) {
    setState(() {
      page = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _display();
  }

  // Displays for each page !!
  _display() {
    switch (page) {
      case PAGES.CAMERA:
        return Camera();
        break;
      case PAGES.DASHBOARD:
        return PlannetAnimation();
        break;
      case PAGES.INFO:
        return PlannetAnimation(plannet: 'Mars');
        break;
    }
  }
}
