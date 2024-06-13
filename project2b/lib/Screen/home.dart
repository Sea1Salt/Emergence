import 'package:flutter/material.dart';
import 'package:project2b/Screen/BrokenArm.dart';
import 'package:project2b/Screen/Dev.dart';
import 'package:project2b/Screen/EmergencyCall1.dart';
import 'package:project2b/Screen/EmergencyCall2.dart';
import 'package:project2b/Screen/Profile.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/login.dart';
import 'package:project2b/Screen/main.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Screen/register.dart';
import 'package:project2b/Screen/popup.dart';
import 'package:project2b/Screen/AppSideBar.dart';
import 'package:project2b/Screen/test.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('EMERGENCE'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100, 60, 100, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("assets/images/ambu2.png"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "EMERGENCE",
                    style: TextStyle(
                        fontSize: 35, color: Color.fromARGB(255, 111, 66, 192)),
                  ),
                  const Text(
                    "Save time Save your life",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(height: 150),
                  SizedBox(
                      child: ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text(
                      "register",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 66, 192)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegisterApp();
                      }));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 253, 253, 253)),
                      elevation: MaterialStateProperty.all<double>(
                          10), // Adjust elevation
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(
                            color: Color.fromARGB(255, 111, 66, 192)),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 55),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Adjust border radius
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      child: ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: const Text(
                      "login",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 66, 192)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 253, 253, 253)),
                      elevation: MaterialStateProperty.all<double>(
                          10), // Adjust elevation
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 65),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Adjust border radius
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      child: ElevatedButton.icon(
                    icon: const Icon(Icons.settings),
                    label: const Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 66, 192)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EmergencyCallScreen();
                      }));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 253, 253, 253)),
                      elevation: MaterialStateProperty.all<double>(
                          10), // Adjust elevation
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Adjust border radius
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      child: ElevatedButton.icon(
                    icon: const Icon(Icons.account_balance),
                    label: const Text(
                      "profile",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 111, 66, 192)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfileScreen();
                      }));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 253, 253, 253)),
                      elevation: MaterialStateProperty.all<double>(
                          10), // Adjust elevation
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(
                            color: Color.fromARGB(255, 111, 66, 192)),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Adjust border radius
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
