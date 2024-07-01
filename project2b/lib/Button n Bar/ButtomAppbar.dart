import 'package:flutter/material.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/mainmenu.dart';

void main() {
  runApp(ButtomAppbar());
}

class ButtomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Selected Index: $_selectedIndex',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 125, 10, 10),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBottomAppBarItem(context, Icons.settings, 'Settings', 0),
              buildBottomAppBarItem(context, Icons.search, 'Search', 1),
              buildBottomAppBarItem(context, Icons.home, '', 2, isHome: true),
              buildBottomAppBarItem(context, Icons.notifications, 'Notifications', 3),
              buildBottomAppBarItem(context, Icons.account_circle, 'Profile', 4),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildBottomAppBarItem(BuildContext context, IconData icon, String label, int index, {bool isHome = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        if (index == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MainScreen(); // Navigate to main screen
          }));
        } else if (index == 4) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProfileNewScreen(); // Navigate to profile screen
          }));
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  _selectedIndex == index ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                  _selectedIndex == index ? Colors.blue.withOpacity(0.2) : Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(
              icon,
              color: _selectedIndex == index ? Colors.blue : Colors.white,
            ),
          ),
          if (label.isNotEmpty)
            Text(
              label,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.blue : Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
