import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(CurrentLocation());
}

class CurrentLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  final Location _location = Location();
  LatLng? _currentPosition;

  final List<LatLng> _hospitalLocations = [
    LatLng(12.6812, 101.2769), // Rayong Hospital
    LatLng(12.6726, 101.2811), // Bangkok Hospital Rayong
    LatLng(12.6975, 101.2833), // Phayathai Rayong Hospital
    // Add more hospitals here
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final LocationData locationData = await _location.getLocation();
    setState(() {
      _currentPosition =
          LatLng(locationData.latitude!, locationData.longitude!);
    });
    if (_controller != null && _currentPosition != null) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentPosition!,
          zoom: 14.0,
        ),
      ));
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    if (_currentPosition != null) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentPosition!,
          zoom: 14.0,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Hospital',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 234, 209, 150),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _currentPosition == null
                ? CircularProgressIndicator()
                : Container(
                    margin: EdgeInsets.all(10),
                    width: 370,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 234, 209, 150), // Border color
                        width: 3, // Border width
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(12.6812, 101.2769), // Rayong, Thailand
                          zoom: 12,
                        ),
                        mapType: MapType.normal,
                        onMapCreated: _onMapCreated,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        markers: _hospitalLocations.map((location) {
                          return Marker(
                            markerId: MarkerId(location.toString()),
                            position: location,
                            infoWindow: InfoWindow(title: 'Hospital'),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueRed),
                          );
                        }).toSet(),
                      ),
                    ),
                  ),
          ),
          SizedBox(height: 5),
          Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Color.fromARGB(255, 234, 209, 150), // Card border color
                width: 2,
              ),
            ),
            child: Column(
              children: [
                _buildClickableText('Option 1', () {
                  // Handle Option 1 click
                }),
                Divider(
                    color: Color.fromARGB(255, 234, 209, 150), thickness: 2),
                _buildClickableText('Option 2', () {
                  // Handle Option 2 click
                }),
                Divider(
                    color: Color.fromARGB(255, 234, 209, 150), thickness: 2),
                _buildClickableText('Option 3', () {
                  // Handle Option 3 click
                }),
                Divider(
                    color: Color.fromARGB(255, 234, 209, 150), thickness: 2),
                _buildClickableText('Option 4', () {
                  // Handle Option 4 click
                }),
                Divider(
                    color: Color.fromARGB(255, 234, 209, 150), thickness: 2),
                _buildClickableText('Option 5', () {
                  // Handle Option 5 click
                }),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        backgroundColor: Color.fromARGB(255, 234, 209, 150),
        child: Icon(Icons.local_hospital, color: Colors.white),
      ),
    );
  }

  Widget _buildClickableText(String text, VoidCallback onTap) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(color: Color.fromARGB(255, 125, 10, 10), fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
