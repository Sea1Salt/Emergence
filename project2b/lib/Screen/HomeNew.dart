import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/AppSideBar.dart';
import 'package:project2b/Button%20n%20Bar/ButtomAppbar.dart';
import 'package:project2b/Button%20n%20Bar/TopAppbar.dart';
import 'package:project2b/Screen/AdminLogin.dart';
import 'package:project2b/Screen/AdminMenu.dart';
import 'package:project2b/Screen/NearbyHos.dart';
import 'package:project2b/Screen/LoginNew.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Service/EmergenceService.dart';

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
      child: SingleChildScrollView(
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
              // Buttons with rounded border shadow
              ButtonWithShadow(
                text: 'Login',
                icon: Icons.login,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreenApp();
                  }));
                },
              ),
              SizedBox(height: 10),
              ButtonWithShadow(
                text: 'Register',
                icon: Icons.app_registration,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisNewScreen();
                  }));
                },
              ),
              SizedBox(height: 10),
              ButtonWithShadow(
                text: 'Admin',
                icon: Icons.admin_panel_settings,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }));
                },
              ),
              SizedBox(height: 10),
              ButtonWithShadow(
                text: 'Test code',
                icon: Icons.baby_changing_station,
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) {
                  
                     return AdminMenu();
                  }));
                  
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ButtonWithShadow extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const ButtonWithShadow({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
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
            Text(text),
            SizedBox(width: 10),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
