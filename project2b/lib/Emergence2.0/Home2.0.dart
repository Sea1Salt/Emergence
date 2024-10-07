import 'package:flutter/material.dart';
import 'package:project2b/Emergence2.0/MainMenu2.0.dart';
import 'package:project2b/Screen/AdminDetail.dart';
import 'package:project2b/Screen/AdminMenu.dart';
import 'package:project2b/Screen/HomeNew.dart';
import 'package:project2b/Emergence2.0/Login2.0.dart';
import 'package:project2b/Screen/LoginNew.dart';
import 'package:project2b/Emergence2.0/Regis2.0.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/FirstAidVdo/BrokenArmV.dart';

// void main() {
//   runApp(HomeNewScreen());
// }

// class HomeNewScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreenState2 createState() => _HomeScreenState2();
}

class _HomeScreenState2 extends State<HomeScreen2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start animations
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [
      //           Color.fromARGB(255, 125, 10, 10),
      //           const Color.fromARGB(255, 0, 0, 0),
      //         ],
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //       ),
      //     ),
      //   ),
      //   title: Text('EMERGENCE', style: TextStyle(color: Colors.white)),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Image.asset(
      //         'assets/images/ambu_png.png',
      //         color: Color.fromARGB(255, 255, 255, 255),
      //       ),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/EMG2.0.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Opacity layer
          AnimatedOpacity(
            duration: Duration(milliseconds: 800),
            opacity: 0.0,
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Center(
            //child: SingleChildScrollView(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 120, 25, 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image at the top
                      Image.asset(
                        'assets/images/Ambu2_png.png',
                        height: 180,
                      ),
                      SizedBox(height: 0),
                      // Title and subtitle
                      Text(
                        'Emergence',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Faustina',
                          color: Color.fromARGB(255, 219, 16, 16),
                        ),
                      ),
                      Text(
                        'Save time Save your life',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(height: 200),
                      // Buttons with rounded border shadow
                      GradientButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreenApp2();
                          }));
                        },
                        width: 300, // Custom width
                        height: 42, // Custom height
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255),
                        ],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '  Sign In ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 167, 0, 0),
                                fontSize: 16,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Faustina',
                              ),
                            ),
                            Icon(Icons.login,
                                color: Color.fromARGB(255, 167, 0, 0)),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      GradientButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisNewScreen2();
                          }));
                        },
                        width: 300, // Custom width
                        height: 42, // Custom height
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255),
                        ],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '  Sign Up ',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 167, 0, 0),
                                fontSize: 16,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Faustina',
                              ),
                            ),
                            Icon(Icons.app_registration,
                                color: const Color.fromARGB(255, 167, 0, 0)),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      GradientButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MainScreen2();
                          }));
                        },
                        width: 300, // Custom width
                        height: 42, // Custom height
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255),
                        ],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '  MainMenu ',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 167, 0, 0),
                                fontSize: 16,
                                //fontWeight: FontWeight.bold,
                                fontFamily: 'Faustina',
                              ),
                            ),
                            Icon(Icons.home,
                                color: const Color.fromARGB(255, 167, 0, 0)),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),

                      // ButtonWithShadow(
                      //   text: 'Admin',
                      //   icon: Icons.admin_panel_settings,
                      //   onPressed: () {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) {
                      //       return MainScreen();
                      //     }));
                      //   },
                      // ),
                      // SizedBox(height: 10),
                      // ButtonWithShadow(
                      //   text: 'Test code',
                      //   icon: Icons.baby_changing_station,
                      //   onPressed: () {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) {
                      //       return AdminMenu();
                      //       //return BrokenArmVideo();
                      //     }));
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //),
        ],
      ),
    );
  }
}

// class ButtonWithShadow extends StatelessWidget {
//   final String text;
//   final IconData icon;
//   final VoidCallback onPressed;

//   const ButtonWithShadow({
//     required this.text,
//     required this.icon,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 7,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//         gradient: LinearGradient(
//           colors: [
//             // Color.fromARGB(255, 125, 10, 10),
//             // Color.fromARGB(255, 0, 0, 0),
//             Colors.white,
//             Color.fromARGB(255, 255, 255, 255),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           //backgroundColor: Color.fromARGB(0, 133, 44, 44),
//           //shadowColor: const Color.fromARGB(0, 255, 255, 255),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(18.0),
//           ),
//           minimumSize: Size(double.infinity, 0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               text,
//               style: TextStyle(
//                 color: Color.fromARGB(255, 219, 16, 16),
//               ),
//             ),
//             SizedBox(width: 10),
//             Icon(
//               icon,
//               color: Color.fromARGB(255, 219, 16, 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final List<Color> colors;
  final Widget child;
  final double width;
  final double height;

  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.colors,
    required this.child,
    this.width = double.infinity,
    this.height = 57.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }
}
