import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2b/Screen/Dev.dart';
import 'package:project2b/Screen/FA.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/popup.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Emergence',
              style:
                  TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
          backgroundColor: Color.fromARGB(255, 125, 10, 10),
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
                  return DevApp(); // Navigate to FourCardBoxes screen
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

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/emergency.jpg'),
          text: 'Emergency Call',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainMenuScreen(); // Navigate to MainMenu screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 125, 10, 10),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/Information.jpg'),
          text: 'Patient Information',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyAppss(); // Navigate to InformationScreen screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 191, 49, 49),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/hospital.jpg'),
          text: 'Nearby Hospital',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainMenuScreen(); // Navigate to FourCardBoxes screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 234, 209, 150),
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 180, // Set the desired height
          image: AssetImage('assets/images/first.jpg'),
          text: 'How to first Aid',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FirstApp(); // Navigate to FourCardBoxes screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 243, 237, 200),
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
