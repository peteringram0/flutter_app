import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';

class PlannetAnimation extends StatelessWidget {
  const PlannetAnimation({Key key, this.plannet = 'Earth'}) : super(key: key);

  final String plannet;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: FlareActor(
          'assets/' + plannet + '.flr',
          controller: FlareControls(),
          animation: 'active',
        ),
      ),
    );
  }
}
