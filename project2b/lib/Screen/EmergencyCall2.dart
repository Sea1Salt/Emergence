import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';

void main() {
  runApp(EmergencyCall2Screen());
}

class EmergencyCall2Screen extends StatelessWidget {
  final TextEditingController _CardNumcontroller1 = TextEditingController();
  final TextEditingController _ComNumcontroller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Call'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Information to identify",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 111, 66, 192)),
              ),
            TextField(
              controller: _CardNumcontroller1,
              decoration: InputDecoration(
                labelText: 'Card Number',
                hintText: "Not Require",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _ComNumcontroller2,
              decoration: InputDecoration(
                labelText: 'communicant Number',
                hintText: "Require",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: ()  {
            

            
           
          },
               style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 253, 253, 253)),
                  elevation:
                      MaterialStateProperty.all<double>(10), // Adjust elevation
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Adjust border radius
                    ),
                  ),
                ),
                child: const Text('Send Info'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
            final cameras = await availableCameras();
            // Get a specific camera from the list of available cameras.
            final firstCamera = cameras.first;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TakePictureScreen(
                camera: firstCamera,
              ); // Navigate to InformationScreen screen
            }));
          },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 253, 253, 253)),
                  elevation:
                      MaterialStateProperty.all<double>(10), // Adjust elevation
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 67),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Adjust border radius
                    ),
                  ),
                ),
                child: const Text('Identify'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
               onPressed: (){
           //navigate
          },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 253, 253, 253)),
                  elevation:
                      MaterialStateProperty.all<double>(10), // Adjust elevation
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Adjust border radius
                    ),
                  ),
                ),
                child: const Text('Contact Staff'),
            ),
          ],
        ),
      ),
    );
  }
}
