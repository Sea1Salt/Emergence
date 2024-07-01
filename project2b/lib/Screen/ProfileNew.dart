import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(ProfileNewScreen());
}

class ProfileNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileBody(),
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
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    model = await EmergenceService.GetPatient();
    setState(() {
      base64String = model.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserProfile(
      model: model,
      base64String: base64String,
    );
  }
}

class UserProfile extends StatelessWidget {
  final Profile model;
  final String base64String;

  const UserProfile({required this.model, required this.base64String});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 145, 42, 42),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: base64String.isEmpty
                        ? AssetImage('assets/images/profile.jpg')
                        : MemoryImage(base64Decode(base64String))
                            as ImageProvider,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        shape: BoxShape.circle,
                      ),
                      // child: IconButton(
                      //   icon: Icon(Icons.camera_alt,
                      //       color: Color.fromARGB(255, 125, 10, 10)),
                      //   onPressed: () async {
                      //     final cameras = await availableCameras();
                           // Get a specific camera from the list of available cameras.
                      //     final firstCamera = cameras.first;
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) {
                      //       return TakePictureScreen(
                      //         camera: firstCamera,
                      //       ); // Navigate to InformationScreen screen
                      //     }));
                      //   },
                      // ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Greeting Message
              Text(
                'Hi, ${model.firstname}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 20),
              // User Info Card
              Card(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUserInfoRow(
                          'Name', '${model.firstname} ${model.lastname}', true),
                      _buildUserInfoRow('Nickname', '${model.nickname}', true),
                      _buildUserInfoRow(
                          'Birthdate', '${model.birthdate}', true),
                      _buildUserInfoRow('Gender', '${model.gender}', true),
                      _buildUserInfoRow('Age', '${model.age}', true),
                      _buildUserInfoRow('Weight', '${model.weight}', true),
                      _buildUserInfoRow('Height', '${model.height}', true),
                      _buildUserInfoRow('Card ID', '${model.cardID}', true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value, bool isHighlighted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: isHighlighted
                    ? Color.fromARGB(255, 125, 10, 10)
                    : Colors.black,
                fontSize: 16,
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
