import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2b/Screen/EmergencyCall2.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/RegisterNew.dart';

double a = 20;

void exitPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 125, 10, 10),
            borderRadius: BorderRadius.vertical(top: Radius.circular(a)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Exit', style: TextStyle(color: Colors.white)),
              Icon(Icons.exit_to_app, color: Colors.white)
            ],
          ),
        ),
        content: Text('Are you sure to exit Emergence?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              SystemNavigator.pop(); // Close the app
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(a),
        ),
      );
    },
  );
}

void InvalidPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 125, 10, 10),
            borderRadius: BorderRadius.vertical(top: Radius.circular(a)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Error', style: TextStyle(color: Colors.white)),
              Icon(Icons.error, color: Colors.white)
            ],
          ),
        ),
        content: Text('Invalid Password'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RegisNewScreen();
              }));
            },
            child: Text('Sign Up'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              "Back",
              style:
                  TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(a),
        ),
      );
    },
  );
}

void EmergencyPopUp(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 125, 10, 10),
            borderRadius: BorderRadius.vertical(top: Radius.circular(a)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Warning', style: TextStyle(color: Colors.white)),
              Icon(Icons.warning, color: Colors.white)
            ],
          ),
        ),
        content: Text('Are you sure to call the ambulance?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EmergencyCall2Screen();
              }));
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 125, 10, 10),
            ),
            child: Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              "Back",
              style:
                  TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(a),
        ),
      );
    },
  );
}

void TakePic(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 125, 10, 10),
            borderRadius: BorderRadius.vertical(top: Radius.circular(a)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Take Successful', style: TextStyle(color: Colors.white)),
              Icon(Icons.check_circle, color: Colors.white)
            ],
          ),
        ),
        content: Text('Picture profile was changed'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileNewScreen();
              }));
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 125, 10, 10),
            ),
            child: Text(
              "Go to profile",
              style:
                  TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(a),
        ),
      );
    },
  );
}

void SaveInfoPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 191, 49, 49),
            borderRadius: BorderRadius.vertical(top: Radius.circular(a)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Saved', style: TextStyle(color: Colors.white)),
              Icon(Icons.warning, color: Colors.white)
            ],
          ),
        ),
        content: Text('Your Information was in our database'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EmergencyCall2Screen();
              }));
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 125, 10, 10),
            ),
            child: Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              "Back",
              style:
                  TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(a),
        ),
      );
    },
  );
}