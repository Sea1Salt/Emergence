import 'package:flutter/material.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/mainmenu.dart';

void main() {
  runApp(DevApp());
}

class DevApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Developer',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: Color.fromARGB(255, 111, 66, 192),
        ),

        body: DevScreen(), //เอาหน้ามาใส่

        // bottomNavigationBar: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   color: Color.fromARGB(255, 111, 66, 192),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       IconButton(
        //         icon: Icon(Icons.settings, color: Colors.white, size: 35),
        //         onPressed: () {
        //           // Navigate to home screen or perform home-related action
        //         },
        //       ),
        //       Text(
        //         '_______________',
        //         style: TextStyle(
        //           fontSize: 25,
        //           color: Colors.white,
        //         ),
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.menu, color: Colors.white, size: 35),
        //         onPressed: () {
        //           // Open menu or perform menu-related action
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return MainScreen();
        //     }));
        //   },
        //   child: Icon(Icons.home, size: 30),
        //   backgroundColor: const Color.fromARGB(
        //       255, 255, 255, 255), // Change background color if needed
        //   foregroundColor:
        //       Color.fromARGB(255, 111, 66, 192), // Change icon color if needed
        //   elevation: 5, // Adjust elevation
        //   heroTag: null, // Remove hero tag to avoid conflicts
        //   mini: false, // Set to false to increase size
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30),
        //     // Adjust border radius
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
