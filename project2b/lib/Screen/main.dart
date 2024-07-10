import 'package:flutter/material.dart';
import 'package:project2b/Screen/HomeNew.dart';

void main() async {
  runApp(HomeScreen());
}

class Firebase {
  static initializeApp({required options}) {}
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emergence',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
