import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

Future<CameraDescription> getCamera(CameraLensDirection dir) async {
  return await availableCameras().then(
    (List<CameraDescription> cameras) => cameras.firstWhere(
          (CameraDescription camera) => camera.lensDirection == dir,
        ),
  );
}

class Camera extends StatefulWidget {
  @override
  _Cam2State createState() => _Cam2State();
}

class _Cam2State extends State<Camera> {
  CameraImage _camImage;
  CameraController _camera;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _camera.stopImageStream();
    super.dispose();
    print('stop video stream');
  }

  void _initializeCamera() async {
    CameraDescription description = await getCamera(CameraLensDirection.front);

    _camera = CameraController(description, ResolutionPreset.medium, enableAudio: false);
    await _camera.initialize();

    _camera.startImageStream((CameraImage image) {
      setState(() {
        _camImage = image;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _camera == null
          ? const Center(
              child: Text(
                'Initializing Camera...',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            )
          : Stack(
              // fit: StackFit.expand,
              children: <Widget>[

                AspectRatio(
                  aspectRatio: _camera.value.aspectRatio,
                  child: CameraPreview(_camera),
                ),

              ],
            ),
    );
  }

}
