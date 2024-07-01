import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:project2b/Screen/DisplayPictureScreen.dart';
import 'package:project2b/Screen/ShowIdentity.dart';

class TakeIdenScreen extends StatefulWidget {
  const TakeIdenScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakeIdenScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int selectedCameraIndex = 0; // Index to track the current camera

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void switchCamera() async {
    final cameras = await availableCameras();
    int newIndex = (selectedCameraIndex + 1) % cameras.length;
    await _controller.dispose();
    _controller = CameraController(
      cameras[newIndex],
      ResolutionPreset.medium,
    );
    setState(() {
      selectedCameraIndex = newIndex;
      _initializeControllerFuture = _controller.initialize();
    });
  }

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
        title: Text('EMERGENCE', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/ambu2.png', // Ensure you have the white logo in assets
              color: Color.fromARGB(
                  255, 255, 255, 255), // Set the image color to white
            ),
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(10, 0, 10, 10), // Custom padding
                child: ClipRect(
                  child: FittedBox(
                    fit: BoxFit
                        .cover, // Ensure the camera preview scales properly
                    child: Container(
                      width: 1000, // Customize the width
                      height: 1500, // Customize the height
                      child: CameraPreview(_controller),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: switchCamera,
            heroTag: "switchCamera",
            backgroundColor:
                Color.fromARGB(255, 125, 10, 10), // Custom background color
            foregroundColor: Colors.white, // Custom icon color
            child: const Icon(Icons.switch_camera),
          ),
          SizedBox(width: 16), // Add space between the buttons
          FloatingActionButton(
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                if (!context.mounted) return;
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => IdentityScreen(
                      imagePath: image.path,
                    ),
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
            heroTag: "takePicture",
            backgroundColor:
                Color.fromARGB(255, 125, 10, 10), // Custom background color
            foregroundColor: Colors.white, // Custom icon color
            child: const Icon(Icons.camera_alt),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
