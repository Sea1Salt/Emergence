import 'package:flutter/material.dart';
import 'package:project2b/Screen/register.dart'; // Import your screens as needed
import 'package:project2b/Screen/login.dart';
import 'package:project2b/Screen/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergence'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100, 60, 100, 0),
          child: Column(
            children: [
              Image.asset("assets/images/ambu2.png"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Emergence",
                style: TextStyle(
                    fontSize: 40, color: Color.fromARGB(255, 111, 66, 192)),
              ),
              const Text(
                "Save time Save your life",
                style: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 150),
              buildAnimatedButton(
                icon: Icons.add,
                label: "Register",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterApp();
                  }));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              buildAnimatedButton(
                icon: Icons.login,
                label: "Login",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              buildAnimatedButton(
                icon: Icons.settings,
                label: "Admin",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedBuilder(
        animation: Tween<double>(begin: 1, end: 0.95).animate(CurvedAnimation(
          parent: AnimationController(
            vsync: this,
            duration: Duration(milliseconds: 300),
          )..forward(),
          curve: Curves.easeInOut,
        )),
        builder: (context, child) {
          return ScaleTransition(
            scale: animation,
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Color.fromARGB(255, 111, 66, 192)),
                  SizedBox(width: 10),
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 111, 66, 192)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
