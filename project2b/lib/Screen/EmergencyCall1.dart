import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project2b/Screen/popup.dart';

void main() {
  runApp(EmergencyCallScreen());
}

class EmergencyCallScreen extends StatefulWidget {
  @override
  _EmergencyButtonScreenState createState() => _EmergencyButtonScreenState();
}

class _EmergencyButtonScreenState extends State<EmergencyCallScreen> {
  String _selectedValue = 'Broken arm or leg';
  final List<String> _dropdownItems = [
    'Broken arm or leg',
    'Broken head',
    'Faint'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Call',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 125, 10, 10),
      ),
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle emergency button press
                print('Emergency button pressed!');
                EmergencyPopUp(context);
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: Color.fromARGB(255, 125, 10, 10),
                padding: EdgeInsets.all(60), // Background color
              ),
              child: Icon(
                Icons.call,
                size: 70,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "! EMERGENCY BUTTON !",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 22),
            DropdownButton<String>(
              value: _selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue!;
                });
              },
              items:
                  _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
