import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/mainmenu.dart';
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
      appBar: AppBar(
        title: Text('PROFILE', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 125, 10, 10),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35),
            onPressed: () {
              exitPopup(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.people, color: Colors.white, size: 35),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DevScreen(); // Navigate to Dev screen
              }));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/Frame 1.png'), // Set your background image
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  // Greeting Message
                  Text(
                    'Hi, ${model.firstname}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 125, 10, 10),
                    ),
                  ),
                  SizedBox(height: 5),
                  // User Info Card
                  Card(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 60, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildUserInfoRow('Name',
                              '${model.firstname} ${model.lastname}', true),
                          _buildUserInfoRow(
                              'Nickname', '${model.nickname}', true),
                          _buildUserInfoRow(
                              'Birthdate', '${model.birthdate}', true),
                          _buildUserInfoRow('Gender', '${model.gender}', true),
                          _buildUserInfoRow('Age', '${model.age}', true),
                          _buildUserInfoRow('Weight', '${model.weight}', true),
                          _buildUserInfoRow('Height', '${model.height}', true),
                          _buildUserInfoRow('Card ID', '${model.cardID}', true),
                          _buildUserInfoRow(
                              'Allergic drug', '${model.drugallergy}', true),
                          _buildUserInfoRow(
                              'Allergic food', '${model.foodallergy}', true),
                          _buildUserInfoRow('Congenital disease',
                              '${model.congennitaldisease}', true),
                          _buildUserInfoRow(
                              'Address', '${model.address}', true),
                          _buildUserInfoRow(
                              'Phone number', '${model.tel}', true),
                          _buildUserInfoRow('Emergency number 1',
                              '${model.emergencynum1}', true),
                          _buildUserInfoRow(
                              'Relate name 1 ', '${model.relatename1}', true),
                          _buildUserInfoRow(
                              'Relation 1', '${model.relation1}', true),
                          _buildUserInfoRow('Emergency number 2',
                              '${model.emergencynum2}', true),
                          _buildUserInfoRow(
                              'Relate name 2', '${model.relatename2}', true),
                          _buildUserInfoRow(
                              'Relation 2', '${model.relation2}', true),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 125, 10, 10),
              const Color.fromARGB(255, 0, 0, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
          height: 80, // Set a specific height for the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBottomAppBarItem(context, Icons.settings, 'Settings', () {
                // Navigate to settings screen or perform settings-related action
              }),
              buildBottomAppBarItem(context, Icons.search, 'Search', () {
                // Perform search action
              }),
              buildBottomAppBarItem(context, Icons.home, '', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              }, isHome: true),
              buildBottomAppBarItem(
                context,
                Icons.notifications,
                'Notifications',
                () {
                  // Perform notifications-related action
                },
              ),
              buildBottomAppBarItem(context, Icons.account_circle, 'Profile',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileNewScreen()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomAppBarItem(
    BuildContext context,
    IconData icon,
    String text,
    VoidCallback onPressed, {
    bool isHome = false,
  }) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: isHome
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  )
                : null,
            child: IconButton(
              icon: Icon(icon,
                  color: Colors.white,
                  size: isHome ? 35 : 30), // Set icon color to white
              onPressed: onPressed,
            ),
          ),
        ],
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
