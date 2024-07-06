import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Models/Admin.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Screen/AdminDetail.dart';
import 'package:project2b/Screen/AdminRecieve.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(AdminMenu());
}

class AdminMenu extends StatefulWidget {
  @override
  _AdminMenuScreenState createState() => _AdminMenuScreenState();
}

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late List<Admin> model;
  late Profile Pic = Profile();
  String base64String = "";

  @override
  void initState() {
    super.initState();
    _fetch1Profile();
  }

  Future<void> _fetch1Profile() async {
    print('sssss');
    model = await EmergenceService.GetAdmin();
    Pic = await EmergenceService.GetPatient();

    setState(() {
      base64String = Pic.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserProfile(
      model: Pic,
      base64String: base64String,
    );
  }
}

class _AdminMenuScreenState extends State<AdminMenu> {
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'yellow':
        return Colors.yellow;
      case 'green':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget _getListWidgets() {
    return Column(
      children: model.map((i) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: Color.fromARGB(255, 44, 16, 157),
              width: 2,
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: i!.image.toString().isNotEmpty
                  ? Image.memory(
                      base64Decode(i.image.toString()),
                      width: 40,
                      height: 100,
                      fit: BoxFit.fill,
                    )
                  : Container(
                      width: 40,
                      height: 100,
                      color: Colors.grey,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
            ),
            title: Row(
              children: [
                Text(
                  "${Pic.firstname} ${Pic.lastname}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: 
                  i.status==1? Colors.red
                  :i.status==2?Colors.yellow
                  :i.status==3?Colors.green
                  :Colors.transparent,
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Text(
                  "Communicant Number: ${i.ContactNumber}",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  "Illness: ${i.Illness}",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            onTap: () {
              print('Click............');
              print(Pic.cardID);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenDetail(callid: i.callid),
                ),
              );
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
                  Color.fromARGB(255, 44, 16, 157),
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
                      color: Color.fromARGB(255, 44, 16, 157), // Border color
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
                SizedBox(height: 5),
                Text('Case',
                    style: TextStyle(
                        color: Color.fromARGB(255, 44, 16, 157),
                        fontSize: 25.0)),
                SizedBox(height: 0),
                _getListWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
