import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Models/Hospital.dart';
import 'package:project2b/Screen/Notification.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/Search.dart';
import 'package:project2b/Screen/Setting.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/firstaid.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'dart:convert';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(WaitingScreen());
}

class CurrentLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WaitingScreen(),
    );
  }
}

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingState createState() => _WaitingState();
}

class HospitalSearchDelegate extends SearchDelegate<String> {
  final List<Hospital> hospitals;

  HospitalSearchDelegate(this.hospitals);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = hospitals.where((hospital) =>
        hospital.Hospitalname!.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: results
          .map<ListTile>((a) => ListTile(
                title: Text(a.Hospitalname!),
                onTap: () {
                  close(context, a.Hospitalname!);
                },
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = hospitals.where((hospital) =>
        hospital.Hospitalname!.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: suggestions
          .map<ListTile>((a) => ListTile(
                title: Text(a.Hospitalname!),
                onTap: () {
                  query = a.Hospitalname!;
                  showResults(context);
                },
              ))
          .toList(),
    );
  }
}

class _WaitingState extends State<WaitingScreen> {
  GoogleMapController? _controller;
  final Location _location = Location();
  LatLng? _currentPosition;
  LatLng rayongHospital = LatLng(12.6812, 101.2769); // Rayong Hospital location
  List<LatLng> _hospitalLocations = [];
  List<LatLng> _polylinePoints = [];
  Set<Polyline> _polylines = {};
  List<Hospital> _hospital = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    Future.delayed(Duration.zero, () async {
      _hospital = await EmergenceService.GetHos();
      _hospital.forEach((a) {
        print(a.Hospitalname.toString() +
            " lat : " +
            a.latitude.toString() +
            " Lon :" +
            a.longtitude.toString());
        _hospitalLocations.add(LatLng(a.latitude ?? 0.0, a.longtitude ?? 0.0));
      });
      setState(() {});
    });
  }

  void _getCurrentLocation() async {
    final LocationData locationData = await _location.getLocation();
    setState(() {
      _currentPosition =
          LatLng(locationData.latitude!, locationData.longitude!);
    });
    if (_controller != null && _currentPosition != null) {
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentPosition!,
          zoom: 14.0,
        ),
      ));
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    if (_currentPosition != null) {
      _controller = controller;
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentPosition!,
          zoom: 14.0,
        ),
      ));
    }
  }

  LatLng _getClosestHospital() {
    double minDistance = double.infinity;
    LatLng closestHospital = _hospitalLocations.first;

    for (LatLng hospital in _hospitalLocations) {
      double distance = Geolocator.distanceBetween(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
        hospital.latitude,
        hospital.longitude,
      );

      if (distance < minDistance) {
        minDistance = distance;
        closestHospital = hospital;
      }
    }

    return closestHospital;
  }

  void _navigateToClosestHospital() async {
    if (_currentPosition != null) {
      LatLng closestHospital = _getClosestHospital();
      await _getRoute(_currentPosition!, closestHospital);
      setState(() {});
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: closestHospital,
          zoom: 17.0,
        ),
      ));
    }
  }

  void _navigateToRayongHospital() async {
    if (_currentPosition != null) {
      await _getRoute(_currentPosition!, rayongHospital);
      setState(() {});
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: rayongHospital,
          zoom: 17.0,
        ),
      ));
    }
  }

  Future<void> _getRoute(LatLng start, LatLng end) async {
    String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=YOUR_GOOGLE_API_KEY';

    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == 'OK') {
      List<LatLng> points = [];
      data['routes'][0]['legs'][0]['steps'].forEach((step) {
        points.add(LatLng(
            step['start_location']['lat'], step['start_location']['lng']));
        points.add(
            LatLng(step['end_location']['lat'], step['end_location']['lng']));
      });

      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        points: points,
        color: Colors.blue,
        width: 5,
      ));
    }
  }

  @override
  Widget buildList(BuildContext context) {
    return ListView.builder(
      itemCount: _hospital.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(_hospital[index].Hospitalname.toString()),
            ),
            Divider(), // <-- Divider
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMERGENCE', style: TextStyle(color: Colors.white)),
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
                return DevScreen(); // Navigate to Dev screen
              }));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _currentPosition == null
                  ? CircularProgressIndicator()
                  : Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      width: 370,
                      height: 460,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 22, 22),
                          width: 3,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target:
                                LatLng(12.6812, 101.2769), // Rayong, Thailand
                            zoom: 12,
                          ),
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          markers: _hospital.map((location) {
                            return Marker(
                              markerId: MarkerId(location.toString()),
                              position: LatLng(location.latitude ?? 0.0,
                                  location.longtitude ?? 0.0),
                              infoWindow:
                                  InfoWindow(title: location.Hospitalname),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueRed),
                            );
                          }).toSet(),
                          polylines: _polylines,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 10),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: 370,
              height: 155,
              child: AnimatedCardBox(
                width: 370,
                height: 155,
                image: AssetImage('assets/images/first.jpg'),
                text: 'How to first aid',
                textColor: Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FirstScreen();
                  }));
                },
                gradientColors: [
                  Color.fromARGB(255, 255, 22, 22),
                  Color.fromARGB(255, 50, 18, 163),
                ],
              ),
            ),
          ],
        ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToClosestHospital,
        backgroundColor: Color.fromARGB(255, 255, 22, 22),
        child: Icon(Icons.route, color: Colors.white),
      ),
    );
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
}
