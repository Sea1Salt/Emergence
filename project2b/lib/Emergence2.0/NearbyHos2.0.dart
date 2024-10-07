import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Emergence2.0/MainMenu2.0.dart';
import 'package:project2b/Emergence2.0/PI2.0.dart';
import 'package:project2b/Emergence2.0/Profile2.0.dart';
import 'package:project2b/Models/Hospital.dart';
import 'package:project2b/Screen/Notification.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/Search.dart';
import 'package:project2b/Screen/Setting.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(CurrentLocationHos2());
}

class CurrentLocationHos2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
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

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  GoogleMapController? _controller;
  final Location _location = Location();
  final TextEditingController _searchController = TextEditingController();

  LatLng? _currentPosition;
  LatLng rayongHospital = LatLng(12.6812, 101.2769); // Rayong Hospital location
  List<LatLng> _hospitalLocations = [];
  List<LatLng> _polylinePoints = [];
  Set<Polyline> _polylines = {};
  List<Hospital> _hospital = [];
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );

    // Start animation
    _animationController.forward();

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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          Positioned.fill(
            child: _currentPosition == null
                ? CircularProgressIndicator()
                : AnimatedOpacity(
                    opacity: _opacityAnimation.value,
                    duration: Duration(milliseconds: 500),
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Container( 
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(15),
                            // border: Border.all(
                            //   color: Color.fromARGB(255, 191, 125, 49),
                            //   width: 3,
                            // ),
                            ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
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
                  ),
          ),
          // Search Box
          Positioned(
            top: 40.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search hospitals...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  // Implement search functionality here
                },
              ),
            ),
          ),
          // Overlay for other UI elements
          // Positioned(
          //   top: 80.0,
          //   left: 10.0,
          //   right: 10.0,
          //   bottom: 0,
          //   child: AnimatedOpacity(
          //     opacity: _opacityAnimation.value,
          //     duration: Duration(milliseconds: 500),
          //     child: SlideTransition(
          //       position: _slideAnimation,
          //       child: Container(
          //         margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          //         width: double.infinity,
          //         height: double.infinity,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(15),
          //           border: Border.all(
          //             color: Color.fromARGB(255, 125, 10, 10),
          //             width: 3,
          //           ),
          //         ),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(15),
          //           child: GoogleMap(
          //             initialCameraPosition: CameraPosition(
          //               target: LatLng(12.6812, 101.2769), // Rayong, Thailand
          //               zoom: 12,
          //             ),
          //             mapType: MapType.normal,
          //             onMapCreated: _onMapCreated,
          //             myLocationEnabled: true,
          //             myLocationButtonEnabled: true,
          //             markers: _hospital.map((location) {
          //               return Marker(
          //                 markerId: MarkerId(location.toString()),
          //                 position: LatLng(location.latitude ?? 0.0, location.longtitude ?? 0.0),
          //                 infoWindow: InfoWindow(title: location.Hospitalname),
          //                 icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          //               );
          //             }).toSet(),
          //             polylines: _polylines,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
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
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 40.0, bottom: 16.0), // Set left padding to 10 pixels
          child: FloatingActionButton(
            onPressed: _navigateToClosestHospital,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child: Icon(
              Icons.route,
              color: Color.fromARGB(255, 125, 10, 10),
            ),
          ),
        ),
      ),
    );
  }
}
