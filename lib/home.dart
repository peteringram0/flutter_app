import 'package:flutter/material.dart';
import 'package:flutter_app/smart_flare_animation.dart';
import 'package:flutter_app/main_area.dart';

class Home extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<Home> {
  PAGES loadedPage = PAGES.DASHBOARD;

  @override
  void initState() {
    super.initState();
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
                  // page: _page
                  // page: 'sss',
                  // page: loadedPage
                  ) // @TODO i want to be able to control the loaded page at this level
              ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SmartFlareAnimation(),
          ),
        ],
      ),
    );
  }
}
