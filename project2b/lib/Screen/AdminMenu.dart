import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Models/EMG.dart';
import 'package:project2b/Screen/Dev.dart';
import 'package:project2b/Screen/HomeNew.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(AdminMenu());
}

class AdminMenu extends StatefulWidget {
  @override
  _EmergencyCall2ScreenState createState() => _EmergencyCall2ScreenState();
}

class _EmergencyCall2ScreenState extends State<AdminMenu> {
  final TextEditingController _ID_numberController = TextEditingController();
  final TextEditingController _ComNumcontroller = TextEditingController();
  late GoogleMapController _mapController;
  Location _location = Location();

  LatLng _initialPosition = LatLng(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    var currentLocation = await _location.getLocation();
    setState(() {
      _initialPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EMERGENCY CALL',
              style:
                  TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
          backgroundColor: Color.fromARGB(2255, 70, 59, 59),
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 350,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromARGB(255, 70, 59, 59), // Border color
                      width: 3, // Border width
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition,
                        zoom: 14.0,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      myLocationEnabled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color:
                          Color.fromARGB(255, 70, 59, 59), // Card border color
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    title: Text("Card 1"),
                    subtitle: Text("Description of Card 1"),
                    onTap: () {
                      // Handle card tap
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color:
                          Color.fromARGB(255, 70, 59, 59), // Card border color
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    title: Text("Card 2"),
                    subtitle: Text("Description of Card 2"),
                    onTap: () {
                      // Handle card tap
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      color:
                          Color.fromARGB(255, 70, 59, 59), // Card border color
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    title: Text("Card 3"),
                    subtitle: Text("Description of Card 3"),
                    onTap: () {
                      // Handle card tap
                    },
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
