import 'package:flutter/material.dart';
import 'package:project2b/Screen/BrokenArm.dart';
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
        body: FirstAidScreen(),
      ),
    );
  }
}

class FirstAidScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      children: [
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/1.jpg'),
          text: 'Broken Arm or Leg',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BrokenArmScreen(); // Navigate to BrokenArmScreen
            }));
          },
          backgroundColor: Color.fromARGB(255, 125, 10, 10),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/2.jpg'),
          text: 'Broken Head',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return InformationScreen(); // Navigate to InformationScreen
            }));
          },
          backgroundColor: Color.fromARGB(255, 190, 49, 68),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/3.jpg'),
          text: 'Faint',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return InformationScreen(); // Navigate to InformationScreen
            }));
          },
          backgroundColor: Color.fromARGB(255, 240, 89, 65),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/4.jpg'),
          text: 'Scald',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainMenuScreen(); // Navigate to MainMenuScreen
            }));
          },
          backgroundColor: Color.fromARGB(255, 230, 194, 110),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/5.jpg'),
          text: 'Cardiopulmonary Resuscitation (CPR)',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainMenuScreen(); // Navigate to MainMenuScreen
            }));
          },
          backgroundColor: Color.fromARGB(255, 213, 230, 110),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/6.jpg'),
          text: 'Drowning',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainMenuScreen(); // Navigate to MainMenuScreen
            }));
          },
          backgroundColor: Color.fromARGB(255, 134, 230, 110),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/7.jpg'),
          text: 'Seizures',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainMenuScreen(); // Navigate to MainMenuScreen
            }));
          },
          backgroundColor: Color.fromARGB(255, 110, 230, 208),
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
  final Color backgroundColor;
  final Color textColor;
  final void Function() onPressed; // Callback function to handle tap

  const CardBox({
    required this.image,
    required this.text,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Set rounded corner radius here
      ),
      color: backgroundColor,
      child: InkWell(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0), // Same as Card's border radius
          child: SizedBox(
            width: width,
            height: height,
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
