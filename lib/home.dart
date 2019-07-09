import 'package:flutter/material.dart';
import 'package:flutter_app/smart_flare_animation.dart';

class Home extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 112, 0, 240),
        body: Column(
          children: <Widget>[
//            AppBar(
//              title: const Text('page'),
//            ),
            Expanded(
              child: Align(
                child: Text('Stuff here'),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: SmartFlareAnimation(),
            ),
          ],
        );
    )
  }
}
