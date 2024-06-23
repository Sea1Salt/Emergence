import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2b/Models/Patient.dart';
import 'package:project2b/Screen/Dev.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/TakePictureScreen.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Button%20n%20Bar/AppSideBar.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(InfoScreen());
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Patient Information',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: Color.fromARGB(255, 191, 49, 49),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.people, color: Colors.white, size: 35),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DevApp(); // Navigate to FourCardBoxes screen
                }));
              },
            ),
          ],
        ),
        body: InformationScreen(),
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
                buildBottomAppBarItem(
                    context, Icons.notifications, 'Notifications', () {
                  // Perform notifications-related action
                }),
                buildBottomAppBarItem(context, Icons.account_circle, 'Profile',
                    () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileNewScreen(); // Navigate to main screen
                  }));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomAppBarItem(
      BuildContext context, IconData icon, String text, VoidCallback onPressed,
      {bool isHome = false}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: isHome
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  )
                : null,
            child: IconButton(
              icon: Icon(icon, color: Colors.white, size: isHome ? 35 : 30),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class InformationScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 16, 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _f1Controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'First name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f2Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Last name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f3Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.face, color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Nickename',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f4Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Birthdate',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f5Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.transgender,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Gender',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f6Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.timeline,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Age',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f7Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.monitor_weight,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Weight',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f8Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Height',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f9Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.credit_card,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'ID Card',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextFormField(
                controller: _f10Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_pharmacy,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Allergic Drug',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _f11Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.food_bank,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Allergic Food',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _f12Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_hospital,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Congenital disease',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _f13Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.route,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Home Address',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _f14Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Your phone number',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Contact 1',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: _f15Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Emergency Phone Number 1',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _f16Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _f17Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.group,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Relation',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Contact 2',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: _f18Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Emergency Phone Number 2',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _f19Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _f20Controller,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.group,
                      color: Color.fromARGB(255, 191, 49, 49)),
                  labelText: 'Relation',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Center(

              //   child: ElevatedButton(

              //     onPressed: () async {
              //       try {
              //         final model = Patient(
              //             12,
              //             this._f1Controller.text,
              //             this._f2Controller.text,
              //             this._f3Controller.text,
              //             this._f4Controller.text,
              //             this._f5Controller.text,
              //             int.parse(this._f6Controller.text),
              //             int.parse(this._f7Controller.text),
              //             int.parse(this._f8Controller.text),
              //             this._f9Controller.text,
              //             this._f10Controller.text,
              //             this._f11Controller.text,
              //             this._f12Controller.text,
              //             this._f13Controller.text,
              //             this._f14Controller.text,
              //             this._f15Controller.text,
              //             this._f16Controller.text,
              //             this._f17Controller.text,
              //             this._f18Controller.text,
              //             this._f19Controller.text,
              //             this._f20Controller.text);
              //         var result = await EmergenceService.PatientInfo(model);
              //         print('SAVED');
              //       } catch (err) {}
              //     },
              //     child: const Text('Saved'),
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all<Color>(
              //           const Color.fromARGB(255, 253, 253, 253)),
              //       elevation: MaterialStateProperty.all<double>(
              //           5), // Adjust elevation
              //       textStyle: MaterialStateProperty.all<TextStyle>(
              //         const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              //       ),
              //       padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              //         const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              //       ),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //           borderRadius:
              //               BorderRadius.circular(20), // Adjust border radius
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              ElevatedButton.icon(
                onPressed: () async {
                  SaveInfoPopup(context);
                  try {
                    final model = Patient(
                        0,
                        this._f1Controller.text,
                        this._f2Controller.text,
                        this._f3Controller.text,
                        this._f4Controller.text,
                        this._f5Controller.text,
                        int.parse(this._f6Controller.text),
                        int.parse(this._f7Controller.text),
                        int.parse(this._f8Controller.text),
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
                        this._f20Controller.text);
                    var result = await EmergenceService.PatientInfo(model);
                    SaveInfoPopup(context);
                    print('SAVED');
                  } catch (err) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 191, 49, 49),
                  foregroundColor: Colors.white, // Change text color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: Size(double.infinity, 57),
                ),
                icon: Icon(Icons.save),
                label: Text('SAVE INFO'),
              ),
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

        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 191, 49, 49), // Color of the icon

        child: Icon(Icons.face),
      ),
    );
  }
}
