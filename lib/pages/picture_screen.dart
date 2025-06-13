import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class PictureScreen extends StatefulWidget {
  const PictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<PictureScreen> createState() => _PicturePageState();
}

class PreviewPictureScreen extends StatelessWidget {
  final String imagePath;
  const PreviewPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vista previa')),
      body: Image.file(File(imagePath)),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pop(context, imagePath);
        },
        child: Text('Usar esta foto'),
      ),
    );
  }
}

class _PicturePageState extends State<PictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  TextButton _cameraButton() {
    return TextButton(
      onPressed: () async {
        try {
          await _initializeControllerFuture;
          final image = await _controller.takePicture();

          if (!context.mounted) return;

          /*await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PreviewPictureScreen(imagePath: image.path),
            ),
          );*/

          final imagePath = await Navigator.of(context).push<String>(
            MaterialPageRoute(
              builder: (context) => PreviewPictureScreen(imagePath: image.path),
            ),
          );

          if (imagePath != null) {
            Navigator.pop(context, imagePath);
          }
        } catch (e) {
          print(e);
        }
      },
      child: Icon(Icons.camera, size: 90),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Camara'),
      ),
      body: Center(child: _cameraButton()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
