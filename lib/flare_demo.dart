import 'package:flutter/material.dart';
import 'package:flutter_app/smart_flare_animation.dart';

class FlareDemo extends StatefulWidget {
  @override
  _FlareDemoState createState() => _FlareDemoState();
}

class _FlareDemoState extends State<FlareDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 102, 18, 222),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SmartFlareAnimation()
      )

      // body: CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       title: Text('Sliver App Bar'),
      //       expandedHeight: 125.0,
      //     ),
      //     SliverList(
      //         delegate: SliverChildBuilderDelegate((context, int) {
      //       return Text('Boo');
      //     }, childCount: 100)),
      //     SliverFillRemaining(
      //       child: Text('Foo Text'),
      //     ),
      //   ],
      // ),
      // bottomNavigationBar: SmartFlareAnimation(),

    );
  }
}
