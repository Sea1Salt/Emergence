// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:project2b/Button%20n%20Bar/popup.dart';
// import 'package:project2b/Models/Admin.dart';
// import 'package:project2b/Models/Hospital.dart';
// import 'package:project2b/Models/Profile.dart';
// import 'package:project2b/Screen/Dev.dart';
// import 'package:project2b/Screen/ProfileNew.dart';
// import 'package:project2b/Service/EmergenceService.dart';
// import 'dart:convert';

// void main() {
//   runApp(DetailScreen());
// }

// class DetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _ProfileBodyState extends State<MapScreen> {
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

// class HospitalSearchDelegate extends SearchDelegate<String> {
//   final List<Hospital> hospitals;

//   HospitalSearchDelegate(this.hospitals);

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final results = hospitals.where((hospital) =>
//         hospital.Hospitalname!.toLowerCase().contains(query.toLowerCase()));

//     return ListView(
//       children: results
//           .map<ListTile>((a) => ListTile(
//                 title: Text(a.Hospitalname!),
//                 onTap: () {
//                   close(context, a.Hospitalname!);
//                 },
//               ))
//           .toList(),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestions = hospitals.where((hospital) =>
//         hospital.Hospitalname!.toLowerCase().contains(query.toLowerCase()));

//     return ListView(
//       children: suggestions
//           .map<ListTile>((a) => ListTile(
//                 title: Text(a.Hospitalname!),
//                 onTap: () {
//                   query = a.Hospitalname!;
//                   showResults(context);
//                 },
//               ))
//           .toList(),
//     );
//   }
// }

// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? _controller;
//   final Location _location = Location();
//   LatLng? _currentPosition;
//   LatLng rayongHospital = LatLng(12.6812, 101.2769); // Rayong Hospital location
//   List<LatLng> _hospitalLocations = [];
//   List<LatLng> _polylinePoints = [];
//   Set<Polyline> _polylines = {};
//   List<Hospital> _hospital = [];

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//     Future.delayed(Duration.zero, () async {
//       _hospital = await EmergenceService.GetHos();
//       _hospital.forEach((a) {
//         print(a.Hospitalname.toString() +
//             " lat : " +
//             a.latitude.toString() +
//             " Lon :" +
//             a.longtitude.toString());
//         _hospitalLocations.add(LatLng(a.latitude ?? 0.0, a.longtitude ?? 0.0));
//       });
//       setState(() {});
//     });
//   }

//   void _getCurrentLocation() async {
//     final LocationData locationData = await _location.getLocation();
//     setState(() {
//       _currentPosition =
//           LatLng(locationData.latitude!, locationData.longitude!);
//     });
//     if (_controller != null && _currentPosition != null) {
//       _controller?.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: _currentPosition!,
//           zoom: 14.0,
//         ),
//       ));
//     }
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     if (_currentPosition != null) {
//       _controller = controller;
//       _controller?.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: _currentPosition!,
//           zoom: 14.0,
//         ),
//       ));
//     }
//   }

//   LatLng _getClosestHospital() {
//     double minDistance = double.infinity;
//     LatLng closestHospital = _hospitalLocations.first;

//     for (LatLng hospital in _hospitalLocations) {
//       double distance = Geolocator.distanceBetween(
//         _currentPosition!.latitude,
//         _currentPosition!.longitude,
//         hospital.latitude,
//         hospital.longitude,
//       );

//       if (distance < minDistance) {
//         minDistance = distance;
//         closestHospital = hospital;
//       }
//     }

//     return closestHospital;
//   }

//   void _navigateToClosestHospital() async {
//     if (_currentPosition != null) {
//       LatLng closestHospital = _getClosestHospital();
//       await _getRoute(_currentPosition!, closestHospital);
//       setState(() {});
//       _controller?.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: closestHospital,
//           zoom: 17.0,
//         ),
//       ));
//     }
//   }

//   void _navigateToRayongHospital() async {
//     if (_currentPosition != null) {
//       await _getRoute(_currentPosition!, rayongHospital);
//       setState(() {});
//       _controller?.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: rayongHospital,
//           zoom: 17.0,
//         ),
//       ));
//     }
//   }

//   Future<void> _getRoute(LatLng start, LatLng end) async {
//     String url =
//         'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=YOUR_GOOGLE_API_KEY';

//     http.Response response = await http.get(Uri.parse(url));
//     Map<String, dynamic> data = json.decode(response.body);

//     if (data['status'] == 'OK') {
//       List<LatLng> points = [];
//       data['routes'][0]['legs'][0]['steps'].forEach((step) {
//         points.add(LatLng(
//             step['start_location']['lat'], step['start_location']['lng']));
//         points.add(
//             LatLng(step['end_location']['lat'], step['end_location']['lng']));
//       });

//       _polylines.add(Polyline(
//         polylineId: PolylineId('route'),
//         points: points,
//         color: Colors.blue,
//         width: 5,
//       ));
//     }
//   }

//   @override
//   Widget buildList(BuildContext context) {
//     return ListView.builder(
//       itemCount: _hospital.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: <Widget>[
//             ListTile(
//               title: Text(_hospital[index].Hospitalname.toString()),
//             ),
//             Divider(), // <-- Divider
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     late List<Admin?> model = [];
//     String? base64String;
//     late Profile Pic = Profile();

//     Future<void> _fetch1Profile() async {
//       print('sssss');
//       Pic = await EmergenceService.GetPatient();
//       model = await EmergenceService.GetAdmin();

//       print("Result:");
//       print(Pic);
//       model.forEach((i) {
//         print(i!.CardNumber.toString());
//       });
//       setState(() {
//         //base64String = Pic.image;
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Detail', style: TextStyle(color: Colors.white)),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 125, 10, 10),
//                 Color.fromARGB(255, 0, 0, 0),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35),
//             onPressed: () {
//               exitPopup(context);
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.people, color: Colors.white, size: 35),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return DevApp(); // Navigate to Dev screen
//               }));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(10.0), // Screen padding
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: CircleAvatar(
//                 radius: 80,
//                 backgroundColor: Color.fromARGB(255, 125, 10, 10),
//                 child: CircleAvatar(
//                   radius: 75,
//                   backgroundImage: base64String?.isNotEmpty()
//                       ? MemoryImage(base64Decode(base64String!))
//                       : AssetImage('assets/images/default_avatar.png')
//                           as ImageProvider,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: _currentPosition == null
//                   ? CircularProgressIndicator()
//                   : Container(
//                       margin: EdgeInsets.all(10),
//                       width: 400,
//                       height: 250,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                           color: Color.fromARGB(255, 125, 10, 10),
//                           width: 3,
//                         ),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: GoogleMap(
//                           initialCameraPosition: CameraPosition(
//                             target:
//                                 LatLng(12.6812, 101.2769), // Rayong, Thailand
//                             zoom: 12,
//                           ),
//                           mapType: MapType.normal,
//                           onMapCreated: _onMapCreated,
//                           myLocationEnabled: true,
//                           myLocationButtonEnabled: true,
//                           markers: _hospital.map((location) {
//                             return Marker(
//                               markerId: MarkerId(location.toString()),
//                               position: LatLng(location.latitude ?? 0.0,
//                                   location.longtitude ?? 0.0),
//                               infoWindow:
//                                   InfoWindow(title: location.Hospitalname),
//                               icon: BitmapDescriptor.defaultMarkerWithHue(
//                                   BitmapDescriptor.hueRed),
//                             );
//                           }).toSet(),
//                           polylines: _polylines,
//                         ),
//                       ),
//                     ),
//             ),
//             SizedBox(height: 5),
//             Card(
//               color: Color.fromARGB(255, 255, 255, 255),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//                 side: BorderSide(
//                   color: Color.fromARGB(255, 125, 10, 10), // Card border color
//                   width: 2, // Card border width
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildUserInfoRow(
//                         'Name', '${Pic.firstname} ${Pic.lastname}', true),
//                     _buildUserInfoRow('Nickname', '${Pic.nickname}', true),
//                     _buildUserInfoRow('Birthdate', '${Pic.birthdate}', true),
//                     _buildUserInfoRow('Gender', '${Pic.gender}', true),
//                     _buildUserInfoRow('Age', '${Pic.age}', true),
//                     _buildUserInfoRow('Weight', '${Pic.weight}', true),
//                     _buildUserInfoRow('Height', '${Pic.height}', true),
//                     _buildUserInfoRow('Card ID', '${Pic.cardID}', true),
//                     _buildUserInfoRow(
//                         'Drug_allergy', '${Pic.drugallergy}', true),
//                     _buildUserInfoRow(
//                         'Food_allergy', '${Pic.foodallergy}', true),
//                     _buildUserInfoRow('Congenital_disease',
//                         '${Pic..congennitaldisease}', true),
//                     _buildUserInfoRow('Address', '${Pic.address}', true),
//                     _buildUserInfoRow('Tel', '${Pic.tel}', true),
//                     _buildUserInfoRow('Emergency_phone_number1',
//                         '${Pic.emergencynum1}', true),
//                     _buildUserInfoRow(
//                         'Relate_name1', '${Pic.relation1}', true),
//                     _buildUserInfoRow('Relation1', '${Pic.relation1}', true),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _navigateToClosestHospital,
//         backgroundColor: Color.fromARGB(255, 125, 10, 10),
//         child: Icon(Icons.electric_bolt, color: Colors.white),
//       ),
//     );
//   }

//   Widget _buildUserInfoRow(String label, String value, bool isHighlighted) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: RichText(
//         textAlign: TextAlign.left, // Align text to the left
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: '$label : ',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             TextSpan(
//               text: value,
//               style: TextStyle(
//                 color: isHighlighted
//                     ? Color.fromARGB(255, 125, 10, 10)
//                     : Colors.black,
//                 fontSize: 16,
//                 fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
