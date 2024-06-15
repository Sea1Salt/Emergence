import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const LocationScreen());

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _MyAppState();
}

class _MyAppState extends State<LocationScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(12.688454739545099, 101.21649000607076);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nearby Hosoital'),
          backgroundColor: Color.fromARGB(255, 234, 209, 150),
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 18.0,
          ),
          markers: {
            const Marker(
              markerId: MarkerId('Sydney'),
              position: LatLng(12.688454739545099, 101.21649000607076),
            )
          },
        ),
      ),
    );
  }
}
//12.688454739545099, 101.21649000607076