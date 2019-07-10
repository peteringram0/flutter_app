import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main_area.dart';
// import 'package:flutter_app/camera.dart';

class SmartFlareAnimation extends StatefulWidget {
  final Function(PAGES page) notifyParent;
  SmartFlareAnimation({Key key, @required this.notifyParent}) : super(key: key);

  final double width = 200.0;
  final double height = 200.0;
  _SmartFlareAnimationState createState() => _SmartFlareAnimationState();
}

class _SmartFlareAnimationState extends State<SmartFlareAnimation> {
  final FlareControls animationControls = FlareControls();
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
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

    var topHalf = localTouchPosition.dy < widget.height / 2;
    var left = localTouchPosition.dx < widget.width / 3;
    var right = localTouchPosition.dx > (widget.width / 3) * 2;

    if (topHalf && left && isOpen) {
      _playAnimation('camera_tapped');
      widget.notifyParent(PAGES.CAMERA);
    } else if (topHalf && !left && !right && isOpen) {
      _playAnimation('pulse_tapped');
      widget.notifyParent(PAGES.DASHBOARD);
    } else if (topHalf && right && isOpen) {
      _playAnimation('image_tapped');
      widget.notifyParent(PAGES.INFO);
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
