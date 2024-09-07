import 'package:flutter/material.dart';
import 'package:project2b/Emergence2.0/MainMenu2.0.dart';
import 'package:project2b/Emergence2.0/Profile2.0.dart';
import 'package:video_player/video_player.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/Notification.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/Search.dart';
import 'package:project2b/Screen/Setting.dart';
import 'package:project2b/Screen/mainmenu.dart';

class BrokenArmScreen2 extends StatefulWidget {
  @override
  _BrokenArmScreen2State createState() => _BrokenArmScreen2State();
}

class _BrokenArmScreen2State extends State<BrokenArmScreen2> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/images/BrokenArm.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/EMG2.0.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
          ),
          // Video Player Section with Rounded Borders
          Positioned(
            top: 110,
            left: 10,
            right: 10,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: 350,
                    height: 200, // Customize height here
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 224, 73, 73), width: 3),
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          // Gradient and Text on top of video player
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 224, 73, 73),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16), // Rounded corners
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
          ),
          // Rest of the content
          Positioned(
            top: 295, // Adjust based on your layout
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 20),
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
          ),
        ],
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
                // Navigate to settings screen or perform settings-related action
              }),
              buildBottomAppBarItem(context, Icons.search, 'Search', () {
                // Perform search action
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
                  // Perform notifications-related action
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
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Color.fromARGB(255, 125, 10, 10),
        ),
      ),
    );
  }

  Widget buildStep(String text, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 222, 222),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color.fromARGB(255, 224, 73, 73), width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 224, 73, 73), width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
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
            width:
                45, // Ensure width and height are the same for a perfect circle
            height: 45,
            decoration: BoxDecoration(
                //  shape: BoxShape.circle,
                //  color: isHome ? Colors.white : Colors.transparent,
                //  border: isHome ? Border.all(color: Colors.white, width: 2) : null,
                ),
            child: IconButton(
              icon: Icon(icon,
                  color: isHome
                      ? Color.fromARGB(255, 125, 10, 10)
                      : Color.fromARGB(255, 125, 10, 10),
                  size: 30),
              onPressed: onPressed,
            ),
          ),
          SizedBox(height: 0), // Spacing between icon and text
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Faustina', // Use the Faustina font family
              color: Color.fromARGB(255, 125, 10, 10),
              fontSize: 10, // Adjust font size as needed
            ),
          ),
        ],
      ),
    );
  }
}
