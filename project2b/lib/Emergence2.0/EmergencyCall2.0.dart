import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project2b/Button%20n%20Bar/TopAppbar.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Emergence2.0/MainMenu2.0.dart';
import 'package:project2b/Emergence2.0/Profile2.0.dart';
import 'package:project2b/Models/EMG.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Screen/Identify.dart';
import 'package:project2b/Screen/Notification.dart';
import 'package:project2b/Screen/Search.dart';
import 'package:project2b/Screen/Setting.dart';
import 'package:project2b/Service/EmergenceService.dart';

class EmergencyCall2Screen2 extends StatefulWidget {
  String? base64String;
  EmergencyCall2Screen2({Key? key, this.base64String}) : super(key: key);
  @override
  _EmergencyCall2ScreenState createState() => _EmergencyCall2ScreenState();
}

class _EmergencyCall2ScreenState extends State<EmergencyCall2Screen2>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ID_numberController = TextEditingController();
  final TextEditingController _ComNumcontroller = TextEditingController();
  late GoogleMapController _mapController;
  String _selectedValue = 'other';
  final List<String> _dropdownItems = [
    'Broken arm or leg',
    'Broken head',
    'Faint',
    'other'
  ];
  GoogleMapController? _controller;
  LatLng? _currentPosition;
  Location _location = Location();
  LatLng _initialPosition = LatLng(0.0, 0.0);
  Profile? model;
  bool _visible = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    print(widget.base64String);
    _getUserLocation();
    Future.delayed(Duration.zero, () async {
      model = await EmergenceService.GetPatient();
      setState(() {
        _ID_numberController.text = model!.cardID.toString();
        _ComNumcontroller.text = model!.tel.toString();
        _visible = true;
      });
    });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation =
        Tween<double>(begin: 1.0, end: 0.2).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  LocationData? currentLocation;
  void _getUserLocation() async {
    try {
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
        if (!_serviceEnabled) {
          print('Location services are disabled.');
          return;
        }
      }

      _permissionGranted = await _location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await _location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          print('Location permission denied.');
          return;
        }
      }

      // Fetch the current location
      currentLocation = await _location.getLocation();

      // Update the initial position
      setState(() {
        _initialPosition = LatLng(
          currentLocation?.latitude ?? 0.0,
          currentLocation?.longitude ?? 0.0,
        );
      });

      // Move the camera to the current location
      if (_mapController != null) {
        _mapController.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(
              currentLocation?.latitude ?? 0.0,
              currentLocation?.longitude ?? 0.0,
            ),
          ),
        );
      }
    } catch (e) {
      // Handle error here
      print("Error fetching location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/EMG2.0.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 10),
              child: SingleChildScrollView(
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: 350,
                        height: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
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
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emergency Details',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Faustina',
                                color: Color.fromARGB(255, 125, 10, 10),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/FaceReg.png'), // Replace with your image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            DropdownButtonHideUnderline(
                              child: Container(
                                 width: 350, // Set your desired width
                                      height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      16.0), // Adjust the radius as needed
                                  border: Border.all(
                                    color: Color.fromARGB(
                                        255, 125, 10, 10), // Border color
                                    width: 2.0, // Border width
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: _selectedValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedValue = newValue!;
                                    });
                                  },
                                  items: _dropdownItems
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomContainer(
                                    child: Container(
                                      width: 350, // Set your desired width
                                      height: 43, // Set your desired height
                                      child: TextFormField(
                                        controller: _ID_numberController,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.credit_card,
                                              color: Color.fromARGB(
                                                  255, 125, 10, 10)),
                                          labelText:
                                              'Card Number (not require)',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal:
                                                  15.0), // Adjust padding
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your ID number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CustomContainer(
                                    child: Container(
                                      width: 350, // Set your desired width
                                      height: 43, // Set your desired height
                                      child: TextFormField(
                                        controller: _ComNumcontroller,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.phone,
                                              color: Color.fromARGB(
                                                  255, 125, 10, 10)),
                                          labelText: 'Phone Number (require)',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal:
                                                  15.0), // Adjust padding
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your phone number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 125, 10,
                                      10), // Set your desired background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        16.0), // Adjust border radius
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 9.0, // Adjust vertical padding
                                    horizontal:
                                        10.0, // Adjust horizontal padding
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Identity',
                                  style: TextStyle(
                                    color: Colors.white, 
                                    fontFamily: 'Faustina',// Set text color
                                    fontSize: 18.0, // Set font size
                                    fontWeight:
                                        FontWeight.bold, // Set font weight
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 7),
                            AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: _animation.value,
                                  child: Container(
                                    width: 350, // Set your desired width
                                    height: 60, // Set your desired height
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(214, 167, 0, 0),
                                          Color.fromARGB(197, 12, 0, 185),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .transparent, // Set to transparent to use container's gradient
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        padding: EdgeInsets
                                            .zero, // Remove default padding
                                      ),
                                      onPressed: () async {
                                        if (_ComNumcontroller.text == null ||
                                            _ComNumcontroller.text == "") {
                                          Error(context);
                                          return;
                                        }
                                        try {
                                          final model = EMG(
                                            12,
                                            this._selectedValue,
                                            this._ID_numberController.text,
                                            this._ComNumcontroller.text,
                                            currentLocation!.latitude
                                                .toString(),
                                            currentLocation!.longitude
                                                .toString(),
                                            widget.base64String,
                                          );
                                          var result = await EmergenceService
                                              .EMG_CallREQ(model);

                                          print('SAVED');
                                          print(_selectedValue);
                                          Emergency2PopUp(context);
                                        } catch (err) {}
                                      },
                                      icon: Icon(
                                        Icons.call,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                      label: Text(
                                        'Emergency Call',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'Faustina',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
          height: 65, // Set a specific height for the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBottomAppBarItem(context, Icons.settings, 'Settings', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              }),
              buildBottomAppBarItem(context, Icons.search, 'Search', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              }),
              buildBottomAppBarItem(context, Icons.home, 'Home', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen2()),
                );
              }, isHome: true),
              buildBottomAppBarItem(
                context,
                Icons.notifications,
                'Notifications',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()),
                  );
                },
              ),
              buildBottomAppBarItem(context, Icons.account_circle, 'Profile',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileNewScreen2()),
                );
              }),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;

  CustomContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(16.0), // Adjust the radius as needed
        border: Border.all(
          color: Color.fromARGB(255, 125, 10, 10), // Border color
          width: 2.0, // Border width
        ),
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(16.0), // Same radius as the container
        child: child,
      ),
    );
  }
}

Widget buildBottomAppBarItem(
  BuildContext context,
  IconData icon,
  String text,
  VoidCallback onPressed, {
  bool isHome = false,
}) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 45, // Ensure width and height are the same for a perfect circle
          height: 45,
          decoration: BoxDecoration(
            //  shape: BoxShape.circle,
            //  color: isHome ? Colors.white : Colors.transparent,
            //  border: isHome ? Border.all(color: Colors.white, width: 2) : null,
          ),
          child: IconButton(
            icon: Icon(icon,
                color: isHome
                    ? Color.fromARGB(255, 125, 10, 10)
                    : Color.fromARGB(255, 125, 10, 10),
                size: 30),
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: 0), // Spacing between icon and text
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Faustina', // Use the Faustina font family
            color: Color.fromARGB(255, 125, 10, 10),
            fontSize: 9, // Adjust font size as needed
          ),
        ),
      ],
    ),
  );
}
