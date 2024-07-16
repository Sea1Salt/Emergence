import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/EmergencyCall2.dart';
import 'package:project2b/Service/EmergenceService.dart';

class IdentityScreen extends StatelessWidget {
  final String imagePath;
  //String? base64String;

  const IdentityScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 125, 10, 10),
                const Color.fromARGB(255, 0, 0, 0)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Display picture', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EmergencyCall2Screen(base64String: base64String);
              }));
              print('Sea.......');
              //bool a = await EmergenceService.UploadIden(base64String);
              print(base64String);
              FaceID(context);
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
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 125, 10, 10),
                    const Color.fromARGB(255, 0, 0, 0)
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Take picture again',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
