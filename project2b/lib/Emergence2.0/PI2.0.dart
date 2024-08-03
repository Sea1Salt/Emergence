import 'package:flutter/material.dart';
import 'package:project2b/Emergence2.0/MainMenu2.0.dart';
import 'package:project2b/Emergence2.0/Profile2.0.dart';
import 'package:project2b/Models/Patient.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Service/EmergenceService.dart';
import 'package:camera/camera.dart';

// void main() {
//   runApp(InfoScreen());
// }

class InfoScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'PATIENT INFORMATION',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [
        //           Color.fromARGB(255, 191, 49, 49),
        //           Color.fromARGB(255, 0, 0, 0),
        //         ],
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //       ),
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35),
        //       onPressed: () {
        //         exitPopup(context);
        //       },
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.people, color: Colors.white, size: 35),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => DevScreen()),
        //         );
        //       },
        //     ),
        //   ],
        // ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/EMG2.0.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 800),
              opacity: 0.4,
              child: Container(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            InformationScreen(),
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
                    MaterialPageRoute(
                        builder: (context) => ProfileNewScreen2()),
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final cameras = await availableCameras();
            // Get a specific camera from the list of available cameras.
            final firstCamera = cameras.first;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TakePictureScreen(
                camera: firstCamera,
              ); // Navigate to InformationScreen screen
            }));
          },

          foregroundColor: Color.fromARGB(255, 125, 10, 10),
          backgroundColor:
              Color.fromARGB(255, 255, 255, 255), // Color of the icon

          child: Icon(Icons.face),
        ),
      ),
    );
  }
}

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final TextEditingController _f1Controller = TextEditingController();
  final TextEditingController _f2Controller = TextEditingController();
  final TextEditingController _f3Controller = TextEditingController();
  final TextEditingController _f4Controller = TextEditingController();
  final TextEditingController _f5Controller = TextEditingController();
  final TextEditingController _f6Controller = TextEditingController();
  final TextEditingController _f7Controller = TextEditingController();
  final TextEditingController _f8Controller = TextEditingController();
  final TextEditingController _f9Controller = TextEditingController();
  final TextEditingController _f10Controller = TextEditingController();
  final TextEditingController _f11Controller = TextEditingController();
  final TextEditingController _f12Controller = TextEditingController();
  final TextEditingController _f13Controller = TextEditingController();
  final TextEditingController _f14Controller = TextEditingController();
  final TextEditingController _f15Controller = TextEditingController();
  final TextEditingController _f16Controller = TextEditingController();
  final TextEditingController _f17Controller = TextEditingController();
  final TextEditingController _f18Controller = TextEditingController();
  final TextEditingController _f19Controller = TextEditingController();
  final TextEditingController _f20Controller = TextEditingController();

  InputDecoration commonInputDecoration(String labelText, IconData icon) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: Colors.white),
      labelText: labelText,
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      fillColor: Color.fromARGB(0, 235, 155, 155), // Background color
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.0, // Border width
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.0, // Border width
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2.0, // Border width when focused
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      print('Detailpage........................');
      var result = await EmergenceService.GetPatient();
      _f1Controller.text = result.firstname;
      _f2Controller.text = result.lastname;
      _f3Controller.text = result.nickname;
      _f4Controller.text = result.birthdate;
      _f5Controller.text = result.gender;
      _f6Controller.text = result.age;
      _f7Controller.text = result.weight;
      _f8Controller.text = result.height;
      _f9Controller.text = result.cardID;
      _f10Controller.text = result.drugallergy;
      _f11Controller.text = result.foodallergy;
      _f12Controller.text = result.congennitaldisease;
      _f13Controller.text = result.address;
      _f14Controller.text = result.tel;
      _f15Controller.text = result.emergencynum1;
      _f16Controller.text = result.relatename1;
      _f17Controller.text = result.relation1;
      _f18Controller.text = result.emergencynum2;
      _f19Controller.text = result.relatename2;
      _f20Controller.text = result.relation2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'About me',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f1Controller,
              decoration: commonInputDecoration('First name', Icons.person),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f2Controller,
              decoration: commonInputDecoration('Last name', Icons.person),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f3Controller,
              decoration: commonInputDecoration('Nickname', Icons.face),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f4Controller,
              decoration:
                  commonInputDecoration('Birthdate', Icons.calendar_today),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f5Controller,
              decoration: commonInputDecoration('Gender', Icons.transgender),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f6Controller,
              decoration: commonInputDecoration('Age', Icons.timeline),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f7Controller,
              decoration: commonInputDecoration('Weight', Icons.monitor_weight),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f8Controller,
              decoration: commonInputDecoration('Height', Icons.height),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _f9Controller,
              decoration: commonInputDecoration('ID Card', Icons.credit_card),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f10Controller,
              decoration:
                  commonInputDecoration('Allergic Drug', Icons.local_pharmacy),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f11Controller,
              decoration:
                  commonInputDecoration('Allergic Food', Icons.food_bank),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f12Controller,
              decoration: commonInputDecoration(
                  'Congenital disease', Icons.local_hospital),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f13Controller,
              decoration: commonInputDecoration('Home Address', Icons.route),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f14Controller,
              decoration:
                  commonInputDecoration('Your phone number', Icons.phone),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 20),
            Text(
              'Contact 1',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f15Controller,
              decoration: commonInputDecoration(
                  'Emergency Phone Number 1', Icons.phone),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f16Controller,
              decoration: commonInputDecoration('Name', Icons.person),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f17Controller,
              decoration: commonInputDecoration('Relation', Icons.group),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 20),
            Text(
              'Contact 2',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f18Controller,
              decoration: commonInputDecoration(
                  'Emergency Phone Number 2', Icons.phone),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f19Controller,
              decoration: commonInputDecoration('Name', Icons.person),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _f20Controller,
              decoration: commonInputDecoration('Relation', Icons.group),
              style: TextStyle(color: Colors.white), // Text color
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                try {
                  final model = Patient(
                    0,
                    this._f1Controller.text,
                    this._f2Controller.text,
                    this._f3Controller.text,
                    this._f4Controller.text,
                    this._f5Controller.text,
                    this._f6Controller.text.isNotEmpty
                        ? int.parse(this._f6Controller.text)
                        : 0,
                    this._f7Controller.text.isNotEmpty
                        ? int.parse(this._f7Controller.text)
                        : 0,
                    this._f8Controller.text.isNotEmpty
                        ? int.parse(this._f8Controller.text)
                        : 0,
                    this._f9Controller.text,
                    this._f10Controller.text,
                    this._f11Controller.text,
                    this._f12Controller.text,
                    this._f13Controller.text,
                    this._f14Controller.text,
                    this._f15Controller.text,
                    this._f16Controller.text,
                    this._f17Controller.text,
                    this._f18Controller.text,
                    this._f19Controller.text,
                    this._f20Controller.text,
                  );
                  print(model);
                  var result = await EmergenceService.PatientInfo(model);
                  SaveInfoPopup(context);
                  print('SAVED');
                } catch (err) {
                  Error(context);
                }
              },
              icon: Icon(
                Icons.save,
              ), // The icon to display
              label: Text('Save'), // The text to display
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 125, 10, 10),
                backgroundColor:
                    Color.fromARGB(255, 255, 255, 255), // Text and icon color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
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
            color: Color.fromARGB(255, 125, 10, 10),
            fontSize: 10, // Adjust font size as needed
          ),
        ),
      ],
    ),
  );
}
