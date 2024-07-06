import 'dart:convert'; // Add this import for base64 decoding
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Models/Admin.dart';
import 'package:project2b/Models/EMG.dart';
import 'package:project2b/Models/Illness.dart';
import 'package:project2b/Models/Patient.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Screen/AdminDetail.dart';
import 'package:project2b/Screen/HomeNew.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Service/EmergenceService.dart';

// void main() {
//   runApp(DetailScreen());
// }

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

// class ProfileBody extends StatefulWidget {
//   @override
//   _ProfileBodyState createState() => _ProfileBodyState();
// }

// class _ProfileBodyState extends State<ProfileBody> {
//   late List<Admin> model;
//   late Profile Pic = Profile();
//   String base64String = "";

//   @override
//   void initState() {
//     super.initState();
//     _fetch1Profile();
//   }

//   Future<void> _fetch1Profile() async {
//     print('sssss');
//     model = await EmergenceService.GetAdmin();
//     Pic = await EmergenceService.GetPatient();

//     setState(() {
//       base64String = Pic.image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return UserProfile(
//       model: Pic,
//       base64String: base64String,
//     );
//   }
// }

class _DetailScreenState extends State<DetailScreen> {
  late List<Admin?> model = [];
  String? base64String;

  late Profile Pic = Profile();

  Location _location = Location();
  late GoogleMapController _mapController;

  LatLng _initialPosition = LatLng(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _fetch1Profile();
  }

  void _getUserLocation() async {
    var currentLocation = await _location.getLocation();
    setState(() {
      _initialPosition =
          LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
  }

  Future<void> _fetch1Profile() async {
    print('sssss');
    Pic = await EmergenceService.GetPatient();
    model = await EmergenceService.GetAdmin();

    print("Result:");
    print(Pic);
    model.forEach((i) {
      print(i!.CardNumber.toString());
    });
    setState(() {
      //base64String = Pic.image;
    });
  }

  @override
  Widget _getListWidgets() {
    return Column(
      children: model.map((i) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: Color.fromARGB(255, 125, 10, 10), // Card border color
              width: 2,
            ),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: i!.image.toString().isNotEmpty
                  ? Image.memory(
                      base64Decode(i.image.toString()),
                      width: 50,
                      height: 100,
                      fit: BoxFit.fill,
                    )
                  : Container(
                      width: 200,
                      height: 100,
                      color: Colors.grey,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Name: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "${Pic.firstname!} ${Pic.lastname!}",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Communicant Number: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "${i.ContactNumber}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Illness: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "${i.Illness}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              onPressed:
              () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(); // Navigate to Dev screen
                }));
              };
            },
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EMERGENCY CASE', style: TextStyle(color: Colors.white)),
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
                      color: Color.fromARGB(255, 125, 10, 10), // Border color
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
                Text('Case',
                    style: TextStyle(
                        color: Color.fromARGB(255, 125, 10, 10),
                        fontSize: 25.0)),
                SizedBox(height: 10),
                _getListWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
