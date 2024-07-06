import 'package:flutter/material.dart';
import 'package:project2b/Screen/EmergencyCall2.dart';
import 'package:project2b/Screen/NearbyHos.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/firstaid.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EMERGENCE', style: TextStyle(color: Colors.white)),
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
        body: MainMenuScreen(),
      ),
    );
  }
}

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
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
    return Stack(
      children: [
        // Background image with opacity
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Frame 1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        AnimatedOpacity(
          duration: Duration(milliseconds: 800),
          opacity: 0.5,
          child: Container(
            color: Color.fromARGB(255, 24, 22, 22),
          ),
        ),
        FadeTransition(
          opacity: _opacityAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                AnimatedCardBox(
                  width: 200,
                  height: 167,
                  image: AssetImage('assets/images/emergency.jpg'),
                  text: 'EMERGENCY CALL',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EmergencyCall2Screen();
                    }));
                  },
                  gradientColors: [
                    Color.fromARGB(255, 255, 22, 22),
                    Color.fromARGB(255, 50, 18, 163),
                  ],
                ),
                SizedBox(height: 5),
                AnimatedCardBox(
                  width: 200,
                  height: 167,
                  image: AssetImage('assets/images/Information.jpg'),
                  text: 'PATIENT INFORMATION',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InfoScreen();
                    }));
                  },
                  gradientColors: [
                    Color.fromARGB(255, 191, 49, 49),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
                SizedBox(height: 5),
                AnimatedCardBox(
                  width: 200,
                  height: 167,
                  image: AssetImage('assets/images/hospital.jpg'),
                  text: 'NEARBY HOSPITAL',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CurrentLocation();
                    }));
                  },
                  gradientColors: [
                    Color.fromARGB(255, 191, 125, 49),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
                SizedBox(height: 5),
                AnimatedCardBox(
                  width: 200,
                  height: 167,
                  image: AssetImage('assets/images/first.jpg'),
                  text: 'HOW TO FIST AID',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FirstScreen();
                    }));
                  },
                  gradientColors: [
                    Color.fromARGB(255, 49, 170, 191),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCardBox extends StatelessWidget {
  final AssetImage image;
  final String text;
  final double width;
  final double height;
  final List<Color> gradientColors;
  final Color textColor;
  final void Function() onPressed;

  const AnimatedCardBox({
    required this.image,
    required this.text,
    required this.width,
    required this.height,
    required this.gradientColors,
    this.textColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0.0, 0.5), end: Offset.zero)
          .animate(CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeInOut,
      )),
      child: FadeTransition(
        opacity: ModalRoute.of(context)!.animation!,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image(
                        image: image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 20, color: textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
