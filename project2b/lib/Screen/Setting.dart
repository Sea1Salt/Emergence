import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue, // Example: Change app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement action for setting 1
              },
              child: Text('Setting 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement action for setting 2
              },
              child: Text('Setting 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement action for setting 3
              },
              child: Text('Setting 3'),
            ),
          ],
        ),
      ),
    );
  }
}
