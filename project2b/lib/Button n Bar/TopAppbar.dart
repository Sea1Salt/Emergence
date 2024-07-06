import 'package:flutter/material.dart';
import 'package:project2b/Screen/EmergencyCall2.dart';
import 'package:project2b/Screen/NearbyHos.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/firstaid.dart';

Future<void> main() async {
  runApp(TopAppbar());
}

class TopAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/ambu2.png', // Replace with your logo asset
                height: 40,
              ),
              SizedBox(width: 10),
              Text(
                'EMERGENCE',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial', // You can change the font family
                ),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 125, 10, 10),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35),
                onPressed: () {
                  exitPopup(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: IconButton(
                icon: Icon(Icons.people, color: Colors.white, size: 35),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DevScreen(); // Navigate to FourCardBoxes screen
                  }));
                },
              ),
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
          height: 167, // Set the desired height
          image: AssetImage('assets/images/emergency.jpg'),
          text: 'Emergency Call',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              //return EmergencyCall2Screen();
              return InfoScreen(); // Navigate to MainMenu screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 125, 10, 10), gradientColors: [],
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 167, // Set the desired height
          image: AssetImage('assets/images/Information.jpg'),
          text: 'Patient Information',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return InfoScreen(); // Navigate to InformationScreen screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 191, 49, 49), gradientColors: [],
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 167, // Set the desired height
          image: AssetImage('assets/images/hospital.jpg'),
          text: 'Nearby Hospital',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CurrentLocation(); // Navigate to FourCardBoxes screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 234, 209, 150),
          gradientColors: [],
        ),
        CardBox(
          width: 200, // Set the desired width
          height: 167, // Set the desired height
          image: AssetImage('assets/images/first.jpg'),
          text: 'How to first Aid',
          textColor: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FirstScreen(); // Navigate to FourCardBoxes screen
            }));
          },
          backgroundColor: Color.fromARGB(255, 34, 9, 44), gradientColors: [],
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
    required List<Color> gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
      ),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                  ),
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
