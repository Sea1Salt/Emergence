import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/Notification.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/Search.dart';
import 'package:project2b/Screen/Setting.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/mainmenu.dart';

class BrokenArmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Brokenn arm and leg',
              style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 224, 73, 73),
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
        body: SafeArea(
          child: BrokenArm(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 224, 73, 73),
                Color.fromARGB(255, 0, 0, 0),
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
      ),
    );
  }
}

class BrokenArm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/FA_bg.jpg'), // Your background image
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 0, 0, 0)
              .withOpacity(0.4), // Adjust opacity here
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 224, 73, 73),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    // Semi-transparent background
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          'Broken Arm and Leg',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          'แขนขาหัก',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                buildStep(
                  '1. หากมีบาดแผลควรห้ามเลือดและปิดบาดแผลด้วยอุปกรณ์ที่สะอาด',
                  'assets/images/1.1.jpg',
                ),
                buildStep(
                  '2. ประคบน้ำแข็งเพื่อลดอาการปวดและบวม',
                  'assets/images/1.2.jpg',
                ),
                buildStep(
                  '3. ใช้ผ้าสะอาดแขนพยุงกระดูกแขนหรือไม้อะไหล่ หรือใช้ไม้แผ่นไปกระดูกหน้าแข้งข้อพับหรือใช้กระดูกต้นขา',
                  'assets/images/1.3.jpg',
                ),
                buildStep(
                  '4. หลีกเลี่ยงการนวดในบริเวณที่ได้รับบาดเจ็บเพราะอาจทำให้กระดูกเคลื่อนได้',
                  'assets/images/1.4.jpg',
                ),
                buildStep(
                  '5. หลีกเลี่ยงการกินอาหารหรือดื่มเครื่องดื่มต่างๆ',
                  'assets/images/1.5.jpg',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStep(String text, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 222, 222),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 224, 73, 73), width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180, // Adjust the width as needed
                height: 100, // Adjust the height as needed
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 224, 73, 73), width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 13, // Custom text size
                    color: Colors.black, // Custom text color
                    fontWeight: FontWeight.w600, // Custom text boldness
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
