import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:image/image.dart' as img;

import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Service/EmergenceService.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display the Picture'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              final Uint8List bytes = io.File(imagePath).readAsBytesSync();

              img.Image? image = img.decodeImage(bytes);

              // Resize the image to a smaller size (e.g., 300x300)
              img.Image resizedImage =
                  img.copyResize(image!, width: 900, height: 1200);

              // Convert resized image to bytes
              Uint8List resizedBytes =
                  Uint8List.fromList(img.encodeJpg(resizedImage));
              List<int> jpg = img.encodeJpg(resizedImage, quality: 100);
              // Convert to Base64
              String base64String = base64Encode(jpg);
              // Encode to jpg with quality (0-100)

              print('Sea.......');
              bool a = await EmergenceService.UploadPicture(base64String);
              print(base64String);
              TakePic(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Take picture again'),
            ),
          ),
        ],
      ),
    );
  }
}
