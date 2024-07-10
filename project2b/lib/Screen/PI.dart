import 'package:flutter/material.dart';
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

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'PATIENT INFORMATION',
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 191, 49, 49),
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
                // Handle exit button action
              },
            ),
            IconButton(
              icon: Icon(Icons.people, color: Colors.white, size: 35),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DevScreen()),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/PI_bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            InformationScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 191, 49, 49),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
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
                    MaterialPageRoute(builder: (context) => ProfileNewScreen()),
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

          foregroundColor: Color.fromARGB(255, 255, 255, 255),
          backgroundColor:
              Color.fromARGB(255, 183, 66, 66), // Color of the icon

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

//class InformationScreen extends StatelessWidget {
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
        padding: const EdgeInsets.fromLTRB(20, 10, 15, 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About me',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              controller: _f1Controller,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.person, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'First name',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f2Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.person, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Last name',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f3Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.face, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Nickename',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f4Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today,
                    color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Birthdate',
                hintText:"dd-mm-yyyy",
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f5Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.transgender,
                    color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Gender',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f6Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.timeline,
                    color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Age',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f7Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.monitor_weight,
                    color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Weight',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f8Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.height, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Height',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f9Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.credit_card,
                    color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'ID Card',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Adding space between text fields
            TextFormField(
              controller: _f10Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.local_pharmacy,
                    color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Allergic Drug',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _f11Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.food_bank,
                    color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Allergic Food',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _f12Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.local_hospital,
                    color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Congenital disease',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _f13Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.route, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Home Address',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _f14Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.phone, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Your phone number',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Contact 1',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _f15Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.phone, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Emergency Phone Number 1',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _f16Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.person, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Name',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _f17Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.group, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Relation',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Contact 2',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _f18Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.phone, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Emergency Phone Number 2',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _f19Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.person, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Name',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _f20Controller,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.group, color: Color.fromARGB(255, 191, 49, 49)),
                labelText: 'Relation',
                fillColor:
                    Color.fromARGB(255, 255, 255, 255), // Background color
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 191, 49, 49),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ElevatedButton.icon(
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
                      this._f20Controller.text,
                    );
                    var result = await EmergenceService.PatientInfo(model);
                    SaveInfoPopup(context);
                    print('SAVED');
                  } catch (err) {
                    // Handle error
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(0, 255, 255,
                      255), // This makes sure the button is transparent
                  shadowColor: Colors.transparent, // No shadow
                  padding: EdgeInsets.symmetric(
                      vertical: 13.0,
                      horizontal: 119.0), // Adjust padding as needed
                ),
                icon: Icon(Icons.save, color: Colors.white), // Icon color
                label: Text(
                  'SAVE INFO',
                  style: TextStyle(color: Colors.white), // Text color
                ),
              ),
            ),
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
