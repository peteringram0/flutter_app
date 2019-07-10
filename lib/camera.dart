import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<CameraDescription> getCamera(CameraLensDirection dir) async {
  return await availableCameras()
      .then((List<CameraDescription> cameras) => cameras.firstWhere(
            (CameraDescription camera) => camera.lensDirection == dir,
          ));
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
    if(_camera != null) {
      // _camera.dispose();
      _camera.stopImageStream();
    }
    // _camera.dispose();
    // _camera.stopImageStream();
    // _camera.dispose();
    super.dispose();
    print('stop video stream');
  }

  void _initializeCamera() async {
    
    CameraDescription description;

    try {
      description = await getCamera(CameraLensDirection.front);
    } catch (err) {
      return print('No cam detected !!');
    }

    _camera = CameraController(description, ResolutionPreset.medium,
        enableAudio: false);
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
          ? Center(
              child: Text(
                'Initializing Camera...',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          : Stack(
              // fit: StackFit.expand,
              children: <Widget>[
                // AspectRatio(
                //   aspectRatio: _camera.value.aspectRatio,
                //   child: CameraPreview(_camera),
                // ),

                Transform.scale(
                  scale: 1 / _camera.value.aspectRatio,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _camera.value.aspectRatio,
                      child: CameraPreview(_camera),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
