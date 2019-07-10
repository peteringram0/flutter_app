import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/camera.dart';
import 'package:flutter_app/cam2.dart';

class Size {
  static const double width = double.infinity;
  static const double height = 200.0;
}

class SmartFlareAnimation extends StatefulWidget {
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  final FlareControls animationControls = FlareControls();
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
//      constraints: BoxConstraints(minWidth: double.infinity),
      height: Size.height,
      width: Size.width,
//      color: Color.fromARGB(255, 255, 0, 240),
      child: GestureDetector(
        onTapUp: (tapInfo) {
          _tapPosition(tapInfo, animationControls);
        },
        child: FlareActor('assets/button.flr',
            controller: animationControls, animation: 'deactivate'),
      ),
    );
  }

  // Caculate where on the animation they have tapped
  void _tapPosition(TapUpDetails tapInfo, FlareControls animationControls) {
    var localTouchPosition = (context.findRenderObject() as RenderBox)
        .globalToLocal(tapInfo.globalPosition);

    var topHalf = localTouchPosition.dy < Size.height / 2;
    var left = localTouchPosition.dx < Size.width / 3;

    if (topHalf && left) {
      // _playAnimation('camera_tapped');

      // new Camera().build(context);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Camera()),
      );

      _playAnimation('deactivate');
      isOpen = false;
    } else if (!topHalf) {
      if (isOpen) {
        _playAnimation('deactivate');
      } else {
        _playAnimation('activate');
      }
      isOpen = !isOpen;
    }
  }

  // Play the animation
  void _playAnimation(String animation) {
    animationControls.play(animation);
  }
}
