import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/developer.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    "Broken Arm",
    "Faint",
    "Drowning",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notification', style: TextStyle(color: Colors.white)),
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Frame 1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ListTile(
                  title: Text(
                    notifications[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Received at ${DateTime.now().toLocal()}',
                    style: TextStyle(fontSize: 14),
                  ),
                  leading: Icon(Icons.notification_important, color: Color.fromARGB(255, 125, 10, 10)),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Define action on notification tap if needed
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
