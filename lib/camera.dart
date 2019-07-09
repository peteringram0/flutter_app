import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';

// Future<CameraDescription> availableCameras() async {
//   final cameras = await availableCameras();
//   return cameras;
//   // cameras.
//   // final firstCamera = cameras.first;
//   // var controller = CameraController(firstCamera, ResolutionPreset.high);
//   // return controller
// }

Future<void> main() async {
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  final controller = CameraController(firstCamera, ResolutionPreset.high);

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: CameraPreview(controller),
    ),
  );
}

class Camera extends StatefulWidget {
  final CameraDescription camera;

  const Camera({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  CameraState createState() => new CameraState();
}

class CameraState extends State<Camera> {
  CameraController controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // To display the current output from the Camera,
    // create a CameraController.
    controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = controller.initialize();
    
    setState(() {
      
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

    // return Scaffold(
    //     body: Container(
    //         child: Center(
    //             child: GestureDetector(
    //   onTap: () {
    //     print('tap');
    //     Navigator.pop(context);
    //   },
    //   child: Icon(Icons.star, color: Colors.red[500], size: 100),
    // ))));
    // aspectRatio: controller.value.aspectRatio,
    // child: CameraPreview(controller));
    // child: Text('test'));
  }
}

// Start() async {
// final cameras = await availableCameras();
// final firstCamera = cameras.first;

// controller = CameraController(firstCamera, ResolutionPreset.high);

// await controller.initialize();

// print(controller);
// // controller = CameraController(cameras[0], ResolutionPreset.medium);
// // controller.initialize().then((_) {
// // });

// @override
// Widget build(BuildContext context) {
//   return AspectRatio(
//       aspectRatio: controller.value.aspectRatio,
//       child: CameraPreview(controller));
// }
// }

// Stop() {
//   print('Stopping camera');
// }
