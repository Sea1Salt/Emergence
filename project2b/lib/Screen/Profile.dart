import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late Profile model = Profile();
  String base64String = "";
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      model = await EmergenceService.GetPatient();
      setState(() {});
      print("log");
      print(model.firstname);
      base64String = model.image;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64Decode(base64String);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 100,
              backgroundImage:
                  MemoryImage(bytes) // Add your profile picture asset path here
              ),
          SizedBox(height: 20),
          Text(
            model.firstname+" "+model.lastname,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            model.nickname,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          SizedBox(
                  child: ElevatedButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text(
                  "Take the profile picture",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 111, 66, 192)),
                ),
                onPressed: () async {
            final cameras = await availableCameras();
            // Get a specific camera from the list of available cameras.
            final firstCamera = cameras.first;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TakePictureScreen(
                camera: firstCamera,
              ); // Navigate to InformationScreen screen
            }));
          },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 253, 253, 253)),
                  elevation:
                      MaterialStateProperty.all<double>(10), // Adjust elevation
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Color.fromARGB(255, 111, 66, 192)),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Adjust border radius
                    ),
                  ),
                ),
              )),
        ],
        
      ),
    );
  }
}
