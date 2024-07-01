import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/BrokenArm.dart';
import 'package:project2b/Screen/Dev.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/mainmenu.dart';

void main() {
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('HOW TO FIRST AID', style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 49, 170, 191),
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
                  return DevApp(); // Navigate to Dev screen
                }));
              },
            ),
          ],
        ),
        body: FirstAidScreen(),
      ),
    );
  }
}

class FirstAidScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/FA_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 30, 28, 28)
              .withOpacity(0.0), // Adjust opacity here
        ),
        ListView(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          children: [
            CardBox(
              width: 200, // Set the desired width
              height: 150, // Set the desired height
              image: AssetImage('assets/images/1.jpg'),
              text: 'Broken Arm or Leg',
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BrokenArmScreen(); // Navigate to BrokenArmScreen
                }));
              },
              gradientColors: [
                Color.fromARGB(255, 224, 73, 73),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
            CardBox(
              width: 200, // Set the desired width
              height: 150, // Set the desired height
              image: AssetImage('assets/images/2.jpg'),
              text: 'Broken Head',
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InformationScreen(); // Navigate to InformationScreen
                }));
              },
              gradientColors: [
                Color.fromARGB(255, 224, 146, 73),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
            CardBox(
              width: 200, // Set the desired width
              height: 150, // Set the desired height
              image: AssetImage('assets/images/3.jpg'),
              text: 'Faint',
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InformationScreen(); // Navigate to InformationScreen
                }));
              },
              gradientColors: [
                Color.fromARGB(255, 221, 224, 73),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
            CardBox(
              width: 200, // Set the desired width
              height: 150, // Set the desired height
              image: AssetImage('assets/images/4.jpg'),
              text: 'Scald',
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainMenuScreen(); // Navigate to MainMenuScreen
                }));
              },
              gradientColors: [
                Color.fromARGB(255, 141, 224, 73),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
            CardBox(
              width: 200, // Set the desired width
              height: 150, // Set the desired height
              image: AssetImage('assets/images/5.jpg'),
              text: 'Cardiopulmonary Resuscitation (CPR)',
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainMenuScreen(); // Navigate to MainMenuScreen
                }));
              },
              gradientColors: [
                Color.fromARGB(255, 73, 224, 211),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
            CardBox(
              width: 200, // Set the desired width
              height: 150, // Set the desired height
              image: AssetImage('assets/images/6.jpg'),
              text: 'Drowning',
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainMenuScreen(); // Navigate to MainMenuScreen
                }));
              },
              gradientColors: [
                Color.fromARGB(255, 73, 121, 224),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
            CardBox(
              width: 200, // Set the desired width
              height: 150, // Set the desired height
              image: AssetImage('assets/images/7.jpg'),
              text: 'Seizures',
              textColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainMenuScreen(); // Navigate to MainMenuScreen
                }));
              },
              gradientColors: [
                Color.fromARGB(255, 151, 73, 224),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CardBox extends StatelessWidget {
  final AssetImage image;
  final String text;
  final double width;
  final double height;
  final List<Color> gradientColors;
  final Color textColor;
  final void Function() onPressed; // Callback function to handle tap

  const CardBox({
    required this.image,
    required this.text,
    required this.width,
    required this.height,
    this.gradientColors = const [],
    this.textColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Set rounded corner radius here
      ),
      child: InkWell(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(15.0), // Same as Card's border radius
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
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
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
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
    );
  }
}
