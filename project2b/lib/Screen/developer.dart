import 'package:flutter/material.dart';
import 'package:project2b/Screen/Sea.dart';
import 'package:project2b/Screen/mainmenu.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

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
              const Text(
                "Developer Information",
                style: TextStyle(
                    fontSize: 31, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/ซี2.jpg"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Mr.Achira Nitinai",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const Text(
                "R a y o n g w i t t a y a k o m",
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
                    return SeaScreen();
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
              Image.asset("assets/images/ไบเบิ้ล1.jpg"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Mr.Woraphop Kaewthankum",
                style: TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const Text(
                "R a y o n g w i t t a y a k o m",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 15),
              SizedBox(
                  child: ElevatedButton.icon(
                icon: const Icon(Icons.book),
                label: const Text(
                  "Bible",
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
              Image.asset("assets/images/นาย.jpeg"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Mr.Kriddanai Primkajeepong",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const Text(
                "R a y o n g w i t t a y a k o m",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 15),
              SizedBox(
                  child: ElevatedButton.icon(
                icon: const Icon(Icons.nine_k),
                label: const Text(
                  "nine",
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
            ],
          ),
        ),
      ),
    ));
  }
}
