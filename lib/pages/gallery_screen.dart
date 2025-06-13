import 'package:flutter/material.dart';
import 'dart:io';

class GalleryScreen extends StatelessWidget {
  final List<String?> imagePathsOnGallery;

  const GalleryScreen({super.key, required this.imagePathsOnGallery});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 126, 40, 61),
          title: Text('Galeria'),
        ),
        body: ListView.builder(
          itemCount: imagePathsOnGallery.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Image.file(File(imagePathsOnGallery[index]!)),
            );
          },
        ),
      ),
    );
  }
}
