import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';

class MoonAnimation extends StatefulWidget {
  @override
  _MoonAnimationState createState() => _MoonAnimationState();
}

class _MoonAnimationState extends State<MoonAnimation> {
  
  String _animation = 'load';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: FlareActor(
          'assets/Moon.flr',
          controller: FlareControls(),
          animation: _animation,
          callback: (name) {
            if(name == 'load') {
              setState(() {
                _animation = 'active';
              });
            }
          }
        ),
      ),
    );
  }
}
