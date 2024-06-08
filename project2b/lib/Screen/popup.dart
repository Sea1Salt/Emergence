import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2b/Screen/register.dart';

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

void InvalidPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text('Invalid Password'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
               Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegisterApp();
                        }));
            },
            child: Text('Sign Up'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Back'),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      );
    },
  );
}