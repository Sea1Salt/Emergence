import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project2b/Screen/Dev.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Screen/home.dart';
import 'package:project2b/Screen/popup.dart';
import 'package:project2b/Screen/AppSideBar.dart';

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
              return DevApp();// Navigate to FourCardBoxes screen
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                    print('F1: ${_f1Controller.text}');
                    print('F1: ${_f2Controller.text}');
                    print('F3: ${_f3Controller.text}');
                    print('F4: ${_f3Controller.text}');
                    print('F5: ${_f1Controller.text}');
                    print('F6: ${_f2Controller.text}');
                    print('F7: ${_f3Controller.text}');
                    print('F8: ${_f3Controller.text}');
                  },
                  child: const Text('Saved'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 253, 253, 253)),
                    elevation:
                        MaterialStateProperty.all<double>(5), // Adjust elevation
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
