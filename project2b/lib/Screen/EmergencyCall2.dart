import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project2b/Button%20n%20Bar/TopAppbar.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Models/EMG.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Screen/Identify.dart';
import 'package:project2b/Screen/Notification.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/Search.dart';
import 'package:project2b/Screen/Setting.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/firstaid.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Service/EmergenceService.dart';



class EmergencyCall2Screen extends StatefulWidget {
  @override
  _EmergencyCall2ScreenState createState() => _EmergencyCall2ScreenState();
}

class _EmergencyCall2ScreenState extends State<EmergencyCall2Screen>
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
  Location _location = Location();
  LatLng _initialPosition = LatLng(0.0, 0.0);
  Profile? model;
  bool _visible = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
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
      duration: const Duration(milliseconds: 500),
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
    currentLocation = await _location.getLocation();
    setState(() {
      _initialPosition = LatLng(
          currentLocation?.latitude ?? 0.0, currentLocation?.longitude ?? 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Emergency Call',
              style:
                  TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 22, 22),
                  Color.fromARGB(255, 50, 18, 163),
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
                  return DevScreen();
                }));
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/EMG_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 83, 82, 82).withOpacity(0.1),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.red, // example border color
                            width: 3,
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
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 255, 255, 255)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.red, // example border color
                            width: 2,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
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
                        ),
                      ),
                      SizedBox(height: 10),
                      Form(
                        key: _formKey, // Wrap the TextFormFields with Form
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 2),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 255, 255),
                                    Color.fromARGB(255, 255, 255, 255)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.red, // example border color
                                  width: 2,
                                ),
                              ),
                              child: TextFormField(
                                controller: _ID_numberController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.credit_card,
                                      color: Color.fromARGB(255, 255, 22, 22)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your ID card';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            AnimatedContainer(
                              duration: Duration(seconds: 2),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 255, 255),
                                    Color.fromARGB(255, 255, 255, 255)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.red, // example border color
                                  width: 2,
                                ),
                              ),
                              child: TextFormField(
                                controller: _ComNumcontroller,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone,
                                      color: Color.fromARGB(255, 255, 22, 22)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 13.0, horizontal: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _animation.value,
                            child: GradientButton(
                              onPressed: () async {
                                if (_ComNumcontroller.text == null ||
                                    _ComNumcontroller.text == "") {
                                  Error(context);

                                  return;
                                }
                                //if (_formKey.currentState?.validate() ?? false) {
                                try {
                                  final model = EMG(
                                    12,
                                    this._selectedValue,
                                    this._ID_numberController.text,
                                    this._ComNumcontroller.text,
                                    currentLocation!.latitude.toString(),
                                    currentLocation!.longitude.toString(),
                                  );
                                  var result =
                                      await EmergenceService.EMG_CallREQ(model);

                                  print('SAVED');
                                  print(_selectedValue);
                                  Emergency2PopUp(context);
                                } catch (err) {}
                                //}
                              },
                              width: double.infinity,
                              height: 50,
                              colors: [
                                Color.fromARGB(255, 255, 22, 22),
                                Color.fromARGB(255, 50, 18, 163),
                              ],
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'EMERGENCY CALL',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: 500,
                        height: 155,
                        child: AnimatedCardBox(
                          width: 500,
                          height: 155,
                          image: AssetImage('assets/images/FaceReg.png'),
                          text: 'Identify',
                          textColor: Color.fromARGB(255, 255, 255, 255),
                          onPressed: () async {
                            final cameras = await availableCameras();
                            final firstCamera = cameras.first;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return TakeIdenScreen(
                                camera: firstCamera,
                              );
                            }));
                          },
                          gradientColors: [
                            Color.fromARGB(255, 255, 22, 22),
                            Color.fromARGB(255, 50, 18, 163),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
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
                Color.fromARGB(255, 255, 22, 22),
                Color.fromARGB(255, 50, 18, 163),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SizedBox(
            height: 80, // Set a specific height for the BottomAppBar
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
                buildBottomAppBarItem(context, Icons.home, '', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
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
                    MaterialPageRoute(builder: (context) => ProfileNewScreen()),
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
          width: 56,
          height: 56,
          decoration: isHome
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                )
              : null,
          child: IconButton(
            icon: Icon(icon, color: Colors.white, size: isHome ? 35 : 30),
            onPressed: onPressed,
          ),
        ),
      ],
    ),
  );
}
