import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:project2b/Models/Hospital.dart';
import 'dart:convert';
import 'package:project2b/Service/EmergenceService.dart';

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


class _MapScreenState extends State<MapScreen> {
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
        title: Text('Nearby Hospital',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 234, 209, 150),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: HospitalSearchDelegate(_hospital),
              );
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
                      margin: EdgeInsets.all(10),
                       width: 370,
                       height: 640,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 234, 209, 150),
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
            SizedBox(height: 5),
            // Card(
            //   margin: EdgeInsets.all(10),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(15),
            //     side: BorderSide(
            //       color: Color.fromARGB(255, 234, 209, 150),
            //       width: 2,
            //     ),
            //   ),
            //   child: Column(
            //     children: _hospital.asMap().entries.map((entry) {
            //       int index = entry.key;
            //       Hospital hospital = entry.value;
            //       return Column(
            //         children: [
            //           ListTile(
            //             title: Text(hospital.Hospitalname.toString()),
            //             onTap: () {
            //               // Handle item tap
            //             },
            //           ),
            //           if (index < _hospital.length - 1)
            //             Divider(
            //               color: Color.fromARGB(255, 234, 209, 150),
            //               thickness: 1,
            //             ),
            //         ],
            //       );
            //     }).toList(),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToClosestHospital,
        backgroundColor: Color.fromARGB(255, 234, 209, 150),
        child: Icon(Icons.electric_bolt, color: Colors.white),
      ),
    );
  }
}
