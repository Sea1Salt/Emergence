import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:video_player/video_player.dart';

class FaintVideo extends StatefulWidget {
  @override
  _FaintVideoState createState() => _FaintVideoState();
}

class _FaintVideoState extends State<FaintVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Replace 'assets/images/BrokenArm.mp4' with your video file path
    _controller = VideoPlayerController.asset('assets/images/BrokenArm.mp4');

    // Initialize the controller and store the Future for later use
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Image.asset(
          'assets/images/Frame 1.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Faint',
                style: TextStyle(color: Colors.white)),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 221, 224, 73),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // actions: [
            //   IconButton(
            //     icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35),
            //     onPressed: () {
            //       exitPopup(context);
            //     },
            //   ),
            //   IconButton(
            //     icon: Icon(Icons.people, color: Colors.white, size: 35),
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return DevScreen(); // Navigate to Dev screen
            //       }));
            //     },
            //   ),
            // ],
          ),
          body: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use it to play the video
                return Center(
                  child: Container(
                    width: 350, // Customize width here
                    height: 250, // Customize height here
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(20.0), // Rounded corners
                      border: Border.all(
                          color: const Color.fromARGB(255, 221, 224, 73),
                          width: 3.0), // White stroke
                    ),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a loading spinner
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Toggle play/pause
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            backgroundColor: Color.fromARGB(255, 221, 224, 73),
            child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
