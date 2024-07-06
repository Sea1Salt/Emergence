import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Models/Detail.dart';
import 'package:project2b/Models/Hospital.dart';
import 'package:project2b/Screen/AdminRecieve.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Service/EmergenceService.dart';
import 'dart:convert';

class ScreenDetail extends StatefulWidget {
  int? callid;
  ScreenDetail({Key? key, required this.callid}) : super(key: key);
  @override
  _ScreenDetailState createState() => _ScreenDetailState();
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

class _ScreenDetailState extends State<ScreenDetail> {
  GoogleMapController? _controller;
  final Location _location = Location();
  LatLng? _currentPosition;
  LatLng rayongHospital = LatLng(12.6812, 101.2769); // Rayong Hospital location
  List<LatLng> _hospitalLocations = [];
  List<LatLng> _polylinePoints = [];
  Set<Polyline> _polylines = {};
  List<Hospital> _hospital = [];
  late Detail Pic = Detail();

  @override
  void initState() {
    super.initState();
    _currentPosition = LatLng(0.0, 0.0);
    print('Detailpage.........');
    Future.delayed(Duration.zero, () async {
      print('Detailpage........................');
      var _pic = await EmergenceService.GetDetail(widget.callid!);
      print('Card ID :');
      print(widget.callid);
      print(_pic.latitude);
      print(_pic.longitude);
      setState(() {
        Pic = _pic;
      });
      // if(_pic.longitude != "")
      _getCurrentLocation();
    });
  }

  void _getCurrentLocation() async {
    final LocationData locationData = await _location.getLocation();
    setState(() {
      _currentPosition =
          LatLng(double.parse(Pic.latitude), double.parse(Pic.longitude));
      _currentPosition =
          LatLng(locationData.latitude!, locationData.longitude!);
    });
    if (_controller != null && _currentPosition != null) {
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentPosition!,
          zoom: 14.0,
        ),
        //Marker(markerId: const MarkerId()),
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
      // LatLng closestHospital = _getClosestHospital();
      //await _getRoute(_currentPosition!, closestHospital);
      setState(() {});
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target:
              LatLng(double.parse(Pic.latitude), double.parse(Pic.longitude)),
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
  Widget build(BuildContext context) {
    // late List<Admin?> model = [];
    // String? base64String;
    // late Profile Pic = Profile();

    // Future<void> _fetch1Profile() async {
    //   print('sssss');
    //   Pic = await EmergenceService.GetPatient();
    //   model = await EmergenceService.GetAdmin();

    //   print("Result:");
    //   print(Pic);
    //   model.forEach((i) {
    //     print(i!.CardNumber.toString());
    //   });
    //   setState(() {
    //     //base64String = Pic.image;
    //   });
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Detail', style: TextStyle(color: Colors.white)),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10), // Screen padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _currentPosition == null
                  ? CircularProgressIndicator()
                  : Container(
                      margin: EdgeInsets.all(10),
                      width: 400,
                      height: 210,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 44, 16, 157),
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
                          markers: {
                            Marker(
                              markerId: MarkerId("aaa"),
                              position: LatLng(double.parse(Pic.latitude),
                                  double.parse(Pic.longitude)),
                              infoWindow: InfoWindow(
                                  title: Pic.firstname + Pic.lastname),
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueRed),
                            )
                          },
                          polylines: _polylines,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 5),
            // Text(
            //       'INFORMATION',
            //       style: TextStyle(color: Color.fromARGB(255, 125, 10, 10),fontSize: 22),
            //     ),
            //     SizedBox(height: 5),
            Card(
              color: Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: Color.fromARGB(255, 44, 16, 157), // Card border color
                  width: 3, // Card border width
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 87, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUserInfoRow(
                        'Name', '${Pic.firstname} ${Pic.lastname}', true),
                    _buildUserInfoRow('Nickname', '${Pic.nickname}', true),
                    _buildUserInfoRow('Birthdate', '${Pic.birthdate}', true),
                    _buildUserInfoRow('Gender', '${Pic.gender}', true),
                    _buildUserInfoRow('Age', '${Pic.age}', true),
                    _buildUserInfoRow('Weight', '${Pic.weight}', true),
                    _buildUserInfoRow('Height', '${Pic.height}', true),
                    _buildUserInfoRow('Card ID', '${Pic.cardID}', true),
                    _buildUserInfoRow(
                        'Drug_allergy', '${Pic.drugallergy}', true),
                    _buildUserInfoRow(
                        'Food_allergy', '${Pic.foodallergy}', true),
                    _buildUserInfoRow('Congenital_disease',
                        '${Pic.congennitaldisease}', true),
                    _buildUserInfoRow('Address', '${Pic.address}', true),
                    _buildUserInfoRow('Tel', '${Pic.tel}', true),
                    _buildUserInfoRow('Emergency_phone_number1',
                        '${Pic.emergencynum1}', true),
                    _buildUserInfoRow(
                        'Relate_name1', '${Pic.relatename1}', true),
                    _buildUserInfoRow('Relation1', '${Pic.relation1}', true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _navigateToClosestHospital;
            },
            backgroundColor: Color.fromARGB(255, 44, 16, 157),
            child: Icon(Icons.route, color: Colors.white),
            tooltip: '',
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ReceivePopup(callid: widget.callid); // Navigate to Dev screen
                }));
            },
            backgroundColor: Colors.green, // Example color
            child: Icon(Icons.add, color: Colors.white), // Example icon
            tooltip: 'Your Second Action',
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String value, bool isHighlighted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label : ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: isHighlighted
                    ? Color.fromARGB(255, 44, 16, 157)
                    : Colors.black,
                fontSize: 16,
                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
