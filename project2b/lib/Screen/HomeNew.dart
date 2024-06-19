import 'package:flutter/material.dart';
import 'package:project2b/Screen/LoginNew.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/Profile.dart';
import 'package:project2b/Screen/login.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Screen/register.dart';

void main() {
  runApp(HomeNewScreen());
}

class HomeNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image at the top
              Image.asset(
                'assets/images/ambu2.png', // Ensure you have the image in assets
                height: 210,
              ),
              SizedBox(height: 5),
              // Title and subtitle
              Text(
                'EMERGENCE',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 125, 10, 10),
                ),
              ),
              Text(
                'save time save your life',
                style: TextStyle(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 65, 62, 62),
                ),
              ),
              SizedBox(height: 190),
              // Buttons
              ElevatedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreenApp();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 125, 10, 10),
                  foregroundColor: Colors.white, // Change text color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login'),
                    SizedBox(width: 10),
                    Icon(Icons.login),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisNewScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 125, 10, 10),
                  foregroundColor: Colors.white, // Change text color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Register'),
                    SizedBox(width: 10),
                    Icon(Icons.app_registration),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 125, 10, 10),
                  foregroundColor: Colors.white, // Change text color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Admin'),
                    SizedBox(width: 10),
                    Icon(Icons.admin_panel_settings),
                  ],
                ),
              ),
              SizedBox(height: 10),
               ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileNewScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 125, 10, 10),
                  foregroundColor: Colors.white, // Change text color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Test code'),
                    SizedBox(width: 10),
                    Icon(Icons.baby_changing_station),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
