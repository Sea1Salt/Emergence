import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2b/Models/Patient.dart';
import 'package:project2b/Screen/Dev.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Screen/home.dart';
import 'package:project2b/Screen/popup.dart';
import 'package:project2b/Screen/AppSideBar.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(MyAppss());
}

class MyAppss extends StatelessWidget {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white, size: 35),
                onPressed: () {
                  // Navigate to home screen or perform home-related action
                },
              ),
              Text(
                '_______________',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white, size: 35),
                onPressed: () {
                  sidebar(context);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainScreen();
            }));
          },
          child: Icon(Icons.home, size: 30),
          backgroundColor: const Color.fromARGB(
              255, 255, 255, 255), // Change background color if needed
          foregroundColor:
              Color.fromARGB(255, 191, 49, 49), // Change icon color if needed
          elevation: 5, // Adjust elevation
          heroTag: null, // Remove hero tag to avoid conflicts
          mini: false, // Set to false to increase size
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            // Adjust border radius
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _f1Controller,
                decoration: InputDecoration(
                  labelText: 'First name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f2Controller,
                decoration: InputDecoration(
                  labelText: 'Last name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f3Controller,
                decoration: InputDecoration(
                  labelText: 'Birthdate',
                  hintText: 'Enter a date (MM/DD/YYYY)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f4Controller,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f5Controller,
                decoration: InputDecoration(
                  labelText: 'Age',
                  hintText: 'enter only number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f6Controller,
                decoration: InputDecoration(
                  labelText: 'Nickname',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f7Controller,
                decoration: InputDecoration(
                  labelText: 'Weight',
                  hintText: 'kg',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f8Controller,
                decoration: InputDecoration(
                  labelText: 'Height',
                  hintText: 'cm',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f9Controller,
                decoration: InputDecoration(
                  labelText: 'ID Card number',
                  hintText: 'Number 13 digit',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10), // Adding space between text fields
              TextField(
                controller: _f10Controller,
                decoration: InputDecoration(
                  labelText: 'Drug allergy',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _f11Controller,
                decoration: InputDecoration(
                  labelText: 'Food allergy',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _f12Controller,
                decoration: InputDecoration(
                  labelText: 'Congenital disease',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _f13Controller,
                decoration: InputDecoration(
                  labelText: 'Home Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _f14Controller,
                decoration: InputDecoration(
                  labelText: 'Your Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _f15Controller,
                decoration: InputDecoration(
                  labelText: 'Emergency phone number 1',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _f16Controller,
                decoration: InputDecoration(
                  labelText: 'Name ',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _f17Controller,
                decoration: InputDecoration(
                  labelText: 'Relation',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _f18Controller,
                decoration: InputDecoration(
                  labelText: 'Emergency phone number 2',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _f19Controller,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _f20Controller,
                decoration: InputDecoration(
                  labelText: 'Relation',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    
                    try {
                      final model = Patient(
                        12,
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
                      this._f20Controller.text
                      );
                      var result = await EmergenceService.PatientInfo(model);
                      print('SAVED');
                    } catch (err) {}
                  },
                  child: const Text('Saved'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 253, 253, 253)),
                    elevation: MaterialStateProperty.all<double>(
                        5), // Adjust elevation
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Adjust border radius
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
