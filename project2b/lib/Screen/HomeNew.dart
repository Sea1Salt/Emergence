import 'package:flutter/material.dart';
import 'package:project2b/Screen/AdminDetail.dart';
import 'package:project2b/Screen/AdminMenu.dart';
import 'package:project2b/Screen/LoginNew.dart';
import 'package:project2b/Screen/NewMenu.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/mainmenu.dart';

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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start animations
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                const Color.fromARGB(255, 0, 0, 0),
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
              'assets/images/ambu_png.png',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Frame 1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Opacity layer
          AnimatedOpacity(
            duration: Duration(milliseconds: 800),
            opacity: 0.7,
            child: Container(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image at the top
                        Image.asset(
                          'assets/images/Ambu2_png.png',
                          height: 200,
                        ),
                        SizedBox(height: 0),
                        // Title and subtitle
                        Text(
                          'EMERGENCE',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 192, 29, 29),
                          ),
                        ),
                        Text(
                          '"save time save your life"',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        SizedBox(height: 160),
                        // Buttons with rounded border shadow
                        ButtonWithShadow(
                          text: 'Login',
                          icon: Icons.login,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreenApp();
                            }));
                          },
                        ),
                        SizedBox(height: 10),
                        ButtonWithShadow(
                          text: 'Register',
                          icon: Icons.app_registration,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisNewScreen();
                            }));
                          },
                        ),
                        SizedBox(height: 10),
                        ButtonWithShadow(
                          text: 'Admin',
                          icon: Icons.admin_panel_settings,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MainScreen();
                            }));
                          },
                        ),
                        SizedBox(height: 10),
                        ButtonWithShadow(
                          text: 'Test code',
                          icon: Icons.baby_changing_station,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AdminMenu();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 125, 10, 10),
            Color.fromARGB(255, 0, 0, 0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          minimumSize: Size(double.infinity, 30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 10),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
