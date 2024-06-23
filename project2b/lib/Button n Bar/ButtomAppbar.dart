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
        color: Color.fromARGB(255, 191, 49, 49),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainScreen(); // Navigate to main screen
                }));
              }, isHome: true),
              buildBottomAppBarItem(context, Icons.notifications, 'Notifications', () {
                // Perform notifications-related action
              }),
              buildBottomAppBarItem(context, Icons.account_circle, 'Profile', () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileNewScreen(); // Navigate to main screen
                }));
              }),
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

  Widget buildBottomAppBarItem(BuildContext context, IconData icon, String label, Function() onPressed, {bool isHome = false}) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (!isHome) ClipOval(
            child: Container(
              color: _selectedIndex == _bottomNavIcons.indexOf(icon) ? Colors.blue.withOpacity(0.2) : Colors.transparent,
              padding: EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: _selectedIndex == _bottomNavIcons.indexOf(icon) ? Colors.blue : Colors.white,
              ),
            ),
          ),
          if (label.isNotEmpty)
            Text(
              label,
              style: TextStyle(
                color: _selectedIndex == _bottomNavIcons.indexOf(icon) ? Colors.blue : Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  final List<IconData> _bottomNavIcons = [
    Icons.settings,
    Icons.search,
    Icons.home,
    Icons.notifications,
    Icons.account_circle,
  ];
}
