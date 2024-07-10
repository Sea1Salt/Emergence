import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/Notification.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/Search.dart';
import 'package:project2b/Screen/Setting.dart';

import 'package:project2b/Screen/mainmenu.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer information',
            style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 125, 10, 10),
                const Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35), // Changed color to white
        //     onPressed: () {
        //       exitPopup(context);
        //     },
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.people, color: Colors.white, size: 35), // Changed color to white
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
        //         return DevScreen(); // Navigate to Dev screen
        //       }));
        //     },
        //   ),
        // ],
      ),
      body: 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            children: [
              // const Text(
              //   "Developer Information",
              //   style: TextStyle(
              //       fontSize: 31, color: Color.fromARGB(255, 0, 0, 0)),
              // ),
              const SizedBox(height: 20),
              buildDeveloperCard(
                context,
                "assets/images/ซี2.jpg",
                "Mr. Achira Nitinai",
                "R a y o n g w i t t a y a k o m",
                Icons.beach_access,
                "Sea",
                () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return SeaScreen();
                  // }));
                },
              ),
              const SizedBox(height: 20),
              buildDeveloperCard(
                context,
                "assets/images/ไบเบิ้ล1.jpg",
                "Mr. Woraphop Kaewthankum",
                "R a y o n g w i t t a y a k o m",
                Icons.book,
                "Bible",
                () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }));
                },
              ),
              const SizedBox(height: 20),
              buildDeveloperCard(
                context,
                "assets/images/นาย.jpeg",
                "Mr. Kriddanai Primkajeepong",
                "R a y o n g w i t t a y a k o m",
                Icons.nine_k,
                "Nine",
                () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 125, 10, 10),
              const Color.fromARGB(255, 0, 0, 0),
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
    );
  }

  Widget buildDeveloperCard(
    BuildContext context,
    String imagePath,
    String name,
    String school,
    IconData icon,
    String buttonText,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15), // Rounded border
              child: Image.asset(
                imagePath,
                width: 325,
                height: 185,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Text(
              school,
              style: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              icon: Icon(icon, color: Color.fromARGB(255, 125, 10, 10)), // Set icon color to red
              label: Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 19, color: Color.fromARGB(255, 125, 10, 10)),
              ),
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 253, 253, 253)),
                elevation: MaterialStateProperty.all<double>(10),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
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
              icon: Icon(icon, color: Colors.white, size: isHome ? 35 : 30), // Set icon color to white
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
