import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void exitPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Exit'),
        content: Text('Are you sure to exit Emergence'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              SystemNavigator.pop();// Close the dialog
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('No'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      );
    },
  );
}

void main() {
  runApp(MyAppddd());
}

class MyAppddd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popup Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              exitPopup(context);
            },
            child: Text('Show Popup'),
          ),
        ),
      ),
    );
  }
}
