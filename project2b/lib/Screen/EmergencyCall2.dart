import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Models/EMG.dart';
import 'package:project2b/Models/Patient.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Screen/Dev.dart';
import 'package:project2b/Screen/FA.dart';
import 'package:project2b/Screen/HomeNew.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(EmergencyCall2Screen());
}

class EmergencyCall2Screen extends StatefulWidget {
  @override
  _EmergencyCall2ScreenState createState() => _EmergencyCall2ScreenState();
}

class _EmergencyCall2ScreenState extends State<EmergencyCall2Screen> {
  final TextEditingController _ID_numberController = TextEditingController();
  final TextEditingController _ComNumcontroller = TextEditingController();
  late GoogleMapController _mapController;
  String _selectedValue = 'Broken arm or leg';
  final List<String> _dropdownItems = [
    'Broken arm or leg',
    'Broken head',
    'Faint'
  ];
  Location _location = Location();

  LatLng _initialPosition = LatLng(0.0, 0.0);
  Profile? model;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    Future.delayed(Duration.zero, () async {
      model = await EmergenceService.GetPatient();
      setState(() {
        _ID_numberController.text = model!.cardID.toString();
      });
    });
  }

  LocationData? currentLocation;
  void _getUserLocation() async {
    currentLocation = await _location.getLocation();
    setState(() {
      _initialPosition = LatLng(
          currentLocation?.latitude ?? 0.0, currentLocation?.longitude ?? 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('EMERGENCY CALL',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Container(
              //   width: 350,
              //   height: 200,
              //   decoration: BoxDecoration(
              //     color: Colors.white, // Background color
              //     borderRadius: BorderRadius.circular(20),
              //     border: Border.all(
              //       color: Color.fromARGB(255, 125, 10, 10), // Border color
              //       width: 3, // Border width
              //     ),
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(20),
              //     child: GoogleMap(
              //       initialCameraPosition: CameraPosition(
              //         target: _initialPosition,
              //         zoom: 14.0,
              //       ),
              //       onMapCreated: (GoogleMapController controller) {
              //         _mapController = controller;
              //       },
              //       myLocationEnabled: true,
              //     ),
              //   ),
              // ),

              ElevatedButton(
                onPressed: () {
                  // Handle emergency button press
                  print('Emergency button pressed!');
                  EmergencyPopUp(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Color.fromARGB(255, 125, 10, 10),
                  padding: EdgeInsets.all(60), // Background color
                ),
                child: Icon(
                  Icons.call,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "! EMERGENCY BUTTON !",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Text(
              //   "Information to identify",
              //   style: TextStyle(
              //       fontSize: 20, color: Color.fromARGB(255, 125, 10, 10)),
              // ),
              // SizedBox(height: 10),
              TextFormField(
                controller: _ID_numberController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.credit_card,
                      color: Color.fromARGB(255, 125, 10, 10)),
                  // labelText: 'card ID',
                  // labelText: model?.cardID.toString(),

                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ID card';
                  }
                  return null;
                },
              ),
              DropdownButton<String>(
                value: _selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                },
                items: _dropdownItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _ComNumcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone,
                      color: Color.fromARGB(255, 125, 10, 10)),
                  labelText: 'Communicant Number',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    final model = EMG(
                      12,
                      this._selectedValue,
                      this._ID_numberController.text,
                      this._ComNumcontroller.text,
                      currentLocation!.latitude.toString(),
                      currentLocation!.longitude.toString(),
                    );
                    var result = await EmergenceService.EMG_CallREQ(model);

                    print('SAVED');
                    print(_selectedValue);
                  } catch (err) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 125, 10, 10),
                  foregroundColor: Colors.white, // Change text color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(double.infinity, 57),
                ),
                icon: Icon(Icons.send),
                label: Text(
                  'Send Info',
                ),
              ),
              // SizedBox(height: 10),
              // Text(
              //   "More...",
              //   style: TextStyle(
              //       fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
              // ),
              // SizedBox(height: 10),
              // ElevatedButton.icon(
              //   onPressed: () async {
              //     final cameras = await availableCameras();
              //     // Get a specific camera from the list of available cameras.
              //     final firstCamera = cameras.first;
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return TakePictureScreen(
              //         camera: firstCamera,
              //       ); // Navigate to InformationScreen screen
              //     }));
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color.fromARGB(255, 125, 10, 10),
              //     foregroundColor: Colors.white, // Change text color to white
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     minimumSize: Size(double.infinity, 57),
              //   ),
              //   icon: Icon(Icons.perm_identity),
              //   label: Text('Identify'),
              // ),
              // SizedBox(height: 10),
              // ElevatedButton.icon(
              //   onPressed: () async {
              //     //navigateeeeeeeeeee
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color.fromARGB(255, 125, 10, 10),
              //     foregroundColor: Colors.white, // Change text color to white
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //     ),
              //     minimumSize: Size(double.infinity, 57),
              //   ),
              //   icon: Icon(Icons.phone),
              //   label: Text('Contact Staff'),
              // ),
              // SizedBox(height: 10),
              CardBox(
                width: 500, // Set the desired width
                height: 130, // Set the desired height
                image: AssetImage('assets/images/first.jpg'),
                text: 'Identify',
                textColor: const Color.fromARGB(255, 255, 255, 255),
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
                backgroundColor: Color.fromARGB(255, 125, 10, 10),
              ),
              CardBox(
                width: 500, // Set the desired width
                height: 130, // Set the desired height
                image: AssetImage('assets/images/first.jpg'),
                text: 'Contact Staff',
                textColor: const Color.fromARGB(255, 255, 255, 255),
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
                backgroundColor: Color.fromARGB(255, 125, 10, 10),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
