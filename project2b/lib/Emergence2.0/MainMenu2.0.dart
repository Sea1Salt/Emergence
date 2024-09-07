import 'package:flutter/material.dart';
import 'package:project2b/Emergence2.0/EmergencyCall2.0.dart';
import 'package:project2b/Emergence2.0/FirstAid2.0.dart';
import 'package:project2b/Emergence2.0/NearbyHos2.0.dart';
import 'package:project2b/Emergence2.0/PI2.0.dart';
import 'package:project2b/Screen/EmergencyCall2.dart';
import 'package:project2b/Screen/NearbyHos.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/WaitingMenu.dart';
import 'package:project2b/Screen/firstaid.dart';

// void main() {
//   runApp(MainScreen2());
// }

// class MainScreen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MainMenuScreen(),
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//       ),
//     );
//   }
// }

class MainScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/EMG2.0.jpg',
              fit: BoxFit.cover,
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 800),
            opacity: 0.3,
            child: Container(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          // Main content
          Column(
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/images/Real_icon.png',
                height: 140,
              ),

              Column(
                children: [
                  Text(
                    'Emergence',
                    style: TextStyle(
                      fontSize: 32,
                      color: Color.fromARGB(255, 219, 16, 16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Save time Save your life',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Container for Emergency Call and Information Cards
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Emergency Call Section as Info Card with custom size
                      _buildInfoCard(
                        'Emergency Call',
                        'assets/images/emergency.jpg', // Image path
                        () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return EmergencyCall2Screen2();
                          }));
                          print('Emergency Call button pressed');
                        },
                        icon: Icons.call,
                        height: 145, // Custom height
                        width: double.infinity, // Custom width
                        imageHeight: 113, // Custom image height
                        imageWidth: double.infinity, // Custom image width
                      ),

                      SizedBox(height: 0),
                      // Information Cards
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: [
                            _buildInfoCard('Patient Information',
                                'assets/images/NewPI.jpg', () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return InfoScreen2();
                              }));
                              print('Patient Information button pressed');
                            }, icon: Icons.info),
                            _buildInfoCard(
                                'Add Family', 'assets/images/Family.jpg', () {
                              // Action for Add Family card
                              print('Add Family button pressed');
                            }, icon: Icons.group_add),
                            _buildInfoCard(
                                'Nearby Hospital', 'assets/images/hospital.jpg',
                                () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CurrentLocationHos2();
                              }));
                              print('Nearby Hospital button pressed');
                            }, icon: Icons.local_hospital),
                            _buildInfoCard(
                                'How to First Aid', 'assets/images/first.jpg',
                                () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FirstAidScreen2();
                              }));
                              print('How to First Aid button pressed');
                            }, icon: Icons.medical_information),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    String title,
    String? imagePath,
    VoidCallback onTap, {
    IconData? icon,
    double? height,
    double? width,
    double? imageHeight,
    double? imageWidth,
    double iconSize = 30, // Icon size
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height, // Use custom height if provided
        width: width, // Use custom width if provided
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(197, 12, 0, 179),
              Color.fromARGB(197, 168, 0, 0),
            ], // Change gradient colors as needed
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null && imagePath.isNotEmpty) ...[
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(16), // Apply rounded corners
                child: Stack(
                  children: [
                    Image.asset(
                      imagePath,
                      height: imageHeight ??
                          135, // Use custom image height if provided
                      width: imageWidth ??
                          double.infinity, // Use custom image width if provided
                      fit: BoxFit.cover, // Ensures the image fits the box
                    ),
                    if (icon != null)
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          width: iconSize + 10, // Circle background diameter
                          height: iconSize + 10,
                          decoration: BoxDecoration(
                            // color: Colors.white, // Circle background color
                            // shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              icon,
                              size: 40,
                              color: Color.fromARGB(
                                  255, 255, 255, 255), // Icon color
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 5),
            ],
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
