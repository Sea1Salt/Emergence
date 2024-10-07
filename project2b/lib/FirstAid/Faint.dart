import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Emergence2.0/EmergencyCall2.0.dart';
import 'package:project2b/Emergence2.0/MainMenu2.0.dart';
import 'package:project2b/Emergence2.0/Profile2.0.dart';
import 'package:project2b/FirstAidVdo/FainVt.dart';
import 'package:project2b/Screen/Notification.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/Search.dart';
import 'package:project2b/Screen/Setting.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/mainmenu.dart';

class FaintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Faint', style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 221, 224, 73),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              //return AdminMenu();
                              return FaintVideo();
                            }));
                          },
          backgroundColor: Color.fromARGB(255, 221, 224, 73),
          child: Icon(Icons.video_library, color: Colors.white),
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
                        Color.fromARGB(255, 221, 224, 73),
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
                          'Faint',
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
                          'เป็นลม',
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
                  '1.จับผู้ป่วยนอนศีรษะต่ำ ปลดเสื้อผ้าและเข็มขัดให้หลวม',
                  'assets/images/3.1.jpg',
                ),
                buildStep(
                  '2. ห้ามคนมุงดู เพื่อให้อากาศถ่ายเทสะดวก',
                  'assets/images/3.2.jpg',
                ),
                buildStep(
                  '3. ใช้ผ้าเย็นๆ เช็ดตามหน้า คอและแขนขา',
                  'assets/images/3.3.jpg',
                ),
                buildStep(
                  '4. ขณะที่ยังไม่ฟื้นห้ามให้น้ำและอาหารทางปาก',
                  'assets/images/1.5.jpg',
                ),
                buildStep(
                  '5. เมื่อเริ่มรู้สึกตัว อย่าให้ผู้ป่วยลุกขึ้นนั่งทันที ควรให้พักต่ออีกสัก 15-20 นาที',
                  'assets/images/3.5.jpg',
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
          color: Color.fromARGB(255, 233, 236, 222),
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: Color.fromARGB(255, 221, 224, 73), width: 3),
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
                      color: Color.fromARGB(255, 221, 224, 73), width: 3),
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

