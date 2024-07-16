import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/FirstAidVdo/BrokenHeadV.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/mainmenu.dart';

class BrokenHeadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Broken Head', style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 224, 146, 73),
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
                Color.fromARGB(255, 224, 146, 73),
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
                  // Navigate to settings screen or perform settings-related action
                }),
                buildBottomAppBarItem(context, Icons.search, 'Search', () {
                  // Perform search action
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
                    // Perform notifications-related action
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              //return AdminMenu();
                              return BrokenHeadVideo();
                            }));
                          },
          backgroundColor: Color.fromARGB(255, 224, 146, 73),
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
                        Color.fromARGB(255, 224, 146, 73),
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
                          'Broken Head',
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
                          'หัวแตก',
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
                  '1. กดแผลห้ามเลือดหากเป็นไปได้ให้ล้างมือหรือสวมถุงมือกันเชื้อโรคทุกครั้ง',
                  'assets/images/2.jpg',
                ),
                buildStep(
                  '2. ให้ผู้ป่วยนอนลง หากมีสิ่งแปลกปลอมติดอยู่กับแผลให้เอาออกให้หมด',
                  'assets/images/2.2.jpg',
                ),
                buildStep(
                  '3. ใช้ผ้าพันแผลหรือผ้าสะอาดกด แผลไว้ให้แน่น 15 นาที อย่าหยุดกดจนกว่าจะครบเวลา หากเลือดซึมผ่านผ้าให้ใช้ผ้าสะอาดผืนใหม่แปะแล้วกดต่อ',
                  'assets/images/2.3.jpg',
                ),
                buildStep(
                  '4. บาดแผลที่มีอาการบวม บรรเทาลงได้ด้วยการประคบน้ำแข็ง',
                  'assets/images/2.4.jpg',
                ),
                buildStep(
                  '5. เฝ้าสังเกตอาการหมดสติ หรือช็อก',
                  'assets/images/2.5.jpg',
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
          color: Color.fromARGB(255, 236, 235, 222),
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: Color.fromARGB(255, 224, 146, 73), width: 3),
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
                      color: Color.fromARGB(255, 224, 146, 73), width: 3),
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
