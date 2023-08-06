import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class CameraComponent extends StatefulWidget {
  final CameraDescription camera;
  const CameraComponent({Key? key, required this.camera}) : super(key: key);

  @override
  State<CameraComponent> createState() => _CameraComponentState();
}

class _CameraComponentState extends State<CameraComponent> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Create a CameraController instance
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    // Initialize the controller
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.08,
        backgroundColor: BC.blue,
        title: Text(
          'Add Photo ',
          style: TextStyle(
              color: BC.white,
              fontSize: width * 0.067,
              fontFamily: "HelveticaBold"),
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: BC.blue,
        child: const Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            // Ensure that the camera is initialized
            await _initializeControllerFuture;

            // Capture the image and save it to a file
            final image = await _controller.takePicture();
            Navigator.of(context).pop(File(image.path));
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
