import 'package:flutter/material.dart';
import 'package:project2b/Screen/%E0%B8%BABrokenspear.dart';
import 'package:project2b/Screen/BrokenArm.dart';
import 'package:project2b/Screen/Drowning.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/Scald.dart';
import 'package:project2b/Screen/Seizures.dart';
import 'package:project2b/Screen/cpr.dart';
import 'package:project2b/Screen/keanhuk.dart';
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
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
      children: [
        CardBox(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          image: AssetImage('assets/images/1.jpg'),
          text: 'Broken Arm or Leg \n แขนขาหัก',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BrokenArmScreen(); // Navigate to MainMenu screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 125, 10, 10),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          image: AssetImage('assets/images/2.jpg'),
          text: 'Broken Head \n หัวแตก',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BrokenHeadScreen(); // Navigate to InformationScreen screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 191, 49, 49),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          image: AssetImage('assets/images/3.jpg'),
          text: 'Faint \n เป็นลม',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BrokenspearScreen(); // Navigate to FourCardBoxes screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 239, 162, 72),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          image: AssetImage('assets/images/4.jpg'),
          text: 'Scald \n ไฟลวก',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScaldScreen(); // Navigate to FourCardBoxes screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 230, 194, 110),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          image: AssetImage('assets/images/5.jpg'),
          text: 'Cardiopulmonary  Resuscitation (CPR)',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return cprScreen(); // Navigate to FourCardBoxes screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 213, 230, 110),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          image: AssetImage('assets/images/6.jpg'),
          text: 'Drowning \n จมน้ำ',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DrowningScreen(); // Navigate to FourCardBoxes screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 134, 230, 110),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 200, // Set the desired height
          image: AssetImage('assets/images/7.jpg'),
          text: 'Seizures \n อาการชัก',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SeizuresScreen(); // Navigate to FourCardBoxes screen
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
      color: backgroundColor,
      child: InkWell(
        onTap: onPressed, // Assign the onPressed callback to InkWell
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
    );
  }
}
