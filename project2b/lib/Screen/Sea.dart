import 'package:flutter/material.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Screen/AppSideBar.dart';

class SeaScreen extends StatelessWidget {
  const SeaScreen({super.key});

  //const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/ซี2.jpg"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "นาย อชิระ นิตินัย",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const Text(
                "ระยองวิทยาคม",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const Text(
                "ทำหน้าที่",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 15),
              SizedBox(
                  child: ElevatedButton.icon(
                icon: const Icon(Icons.beach_access),
                label: const Text(
                  "Sea",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 111, 66, 192)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainScreen();
                  }));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 253, 253, 253)),
                  elevation:
                      MaterialStateProperty.all<double>(10), // Adjust elevation
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
              )),
              const SizedBox(
                height: 20,
              ),
              
  ])),
      
          ),
        ),
      );
  }
}
