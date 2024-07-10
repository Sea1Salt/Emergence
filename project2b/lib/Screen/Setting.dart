import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = (prefs.getBool('notificationsEnabled') ?? false);
    });
  }

  _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('notificationsEnabled', _notificationsEnabled);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Setting', style: TextStyle(color: Colors.white)),
            flexibleSpace: Container(
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
          body: ListView(
            children: <Widget>[
              SwitchListTile(
                title: Text('Enable Notifications'),
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                  _saveSettings();
                },
                activeColor: const Color.fromARGB(
                    255, 255, 255, 255), // Color of the switch when it's on
                activeTrackColor: Color.fromARGB(
                    255, 30, 165, 100), // Color of the track when the switch is on
                inactiveThumbColor: const Color.fromARGB(
                    255, 255, 255, 255), // Color of the switch when it's off
                inactiveTrackColor: Color.fromARGB(
                    255, 125, 10, 10), // Color of the track when the switch is off
              ),
              // Add more settings options here
            ],
          ),
        ),
      ],
    );
  }
}
