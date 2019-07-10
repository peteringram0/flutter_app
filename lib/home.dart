import 'package:flutter/material.dart';
import 'package:flutter_app/smart_flare_animation.dart';
import 'package:flutter_app/main_area.dart';

class Home extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<Home> {
  PAGES page = PAGES.DASHBOARD;

  @override
  void initState() {
    super.initState();
  }

  // Child will notify this function when an image is clicked from the menu
  void _switchPage(PAGES pageEnum) {
    setState(() {
      page = pageEnum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 122, 20, 220),
      body: Column(
        children: <Widget>[
          //  AppBar(
          //  title: const Text('page'),
          //  ),
          Expanded(
            child: MainArea(
              page: page,
            )
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SmartFlareAnimation(
              notifyParent: _switchPage,
            ),
          ),
        ],
      ),
    );
  }
}
