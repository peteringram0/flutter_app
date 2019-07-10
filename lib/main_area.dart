import 'package:flutter/material.dart';
import 'package:flutter_app/camera.dart';
import 'package:flutter_app/plannet_animation.dart';
import 'package:flutter_app/moon_animation.dart';

class MainArea extends StatefulWidget {
  // PAGES page;
  PageController pageController;
  MainArea({Key key, this.pageController}) : super(key: key);

  @override
  MainAreaState createState() => MainAreaState();
}

enum PAGES { CAMERA, DASHBOARD, INFO }

class MainAreaState extends State<MainArea> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.pageController,
      children: <Widget>[
        Container(child: _display(PAGES.CAMERA)),
        Container(child: _display(PAGES.DASHBOARD)),
        Container(child: _display(PAGES.INFO)),
      ],
    );
  }

  // Displays for each page !!
  _display(PAGES page) {
    switch (page) {
      case PAGES.CAMERA:
        return Camera();
        break;
      case PAGES.DASHBOARD:
        return PlannetAnimation();
        break;
      case PAGES.INFO:
        // return PlannetAnimation(plannet: 'Mars');
        return MoonAnimation();
        break;
    }
  }
}
