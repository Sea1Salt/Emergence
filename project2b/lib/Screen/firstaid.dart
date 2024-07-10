import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/BrokenArm.dart';
import 'package:project2b/Screen/PI.dart';
import 'package:project2b/Screen/ProfileNew.dart';
import 'package:project2b/Screen/developer.dart';
import 'package:project2b/Screen/mainmenu.dart';

void main() {
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('How to first Aid', style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 49, 170, 191),
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
                exitPopup(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.people, color: Colors.white, size: 35),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DevScreen(); // Navigate to Dev screen
                }));
              },
            ),
          ],
        ),
        body: FirstAidScreen(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 49, 170, 191),
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
      ),
    );
  }
}

class FirstAidScreen extends StatefulWidget {
  @override
  _FirstAidScreenState createState() => _FirstAidScreenState();
}

class _FirstAidScreenState extends State<FirstAidScreen>
  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800), // Adjust animation duration
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/FA_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 41, 38, 38).withOpacity(0.4),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return ListView(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              children: [
                buildAnimatedCardBox(
                  width: 200,
                  height: 150,
                  image: AssetImage('assets/images/1.jpg'),
                  text: 'Broken Arm or Leg',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BrokenArmScreen()),
                    );
                  },
                  gradientColors: [
                    Color.fromARGB(255, 224, 73, 73),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
                buildAnimatedCardBox(
                  width: 200,
                  height: 150,
                  image: AssetImage('assets/images/2.jpg'),
                  text: 'Broken Head',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InformationScreen()),
                    );
                  },
                  gradientColors: [
                    Color.fromARGB(255, 224, 146, 73),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
                buildAnimatedCardBox(
                  width: 200,
                  height: 150,
                  image: AssetImage('assets/images/3.jpg'),
                  text: 'Faint',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InformationScreen()),
                    );
                  },
                  gradientColors: [
                    Color.fromARGB(255, 221, 224, 73),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
                buildAnimatedCardBox(
                  width: 200,
                  height: 150,
                  image: AssetImage('assets/images/4.jpg'),
                  text: 'Scald',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenuScreen()),
                    );
                  },
                  gradientColors: [
                    Color.fromARGB(255, 141, 224, 73),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
                buildAnimatedCardBox(
                  width: 200,
                  height: 150,
                  image: AssetImage('assets/images/5.jpg'),
                  text: 'Cardiopulmonary Resuscitation (CPR)',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenuScreen()),
                    );
                  },
                  gradientColors: [
                    Color.fromARGB(255, 73, 224, 211),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
                buildAnimatedCardBox(
                  width: 200,
                  height: 150,
                  image: AssetImage('assets/images/6.jpg'),
                  text: 'Drowning',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenuScreen()),
                    );
                  },
                  gradientColors: [
                    Color.fromARGB(255, 73, 121, 224),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
                buildAnimatedCardBox(
                  width: 200,
                  height: 150,
                  image: AssetImage('assets/images/7.jpg'),
                  text: 'Seizures',
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenuScreen()),
                    );
                  },
                  gradientColors: [
                    Color.fromARGB(255, 151, 73, 224),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget buildAnimatedCardBox({
    required double width,
    required double height,
    required AssetImage image,
    required String text,
    required Color textColor,
    required void Function() onPressed,
    List<Color> gradientColors = const [],
  }) {
    return AnimatedOpacity(
      opacity: _opacityAnimation.value,
      duration: Duration(milliseconds: 500),
      child: SlideTransition(
        position: _slideAnimation,
        child: CardBox(
          width: width,
          height: height,
          image: image,
          text: text,
          textColor: textColor,
          onPressed: onPressed,
          gradientColors: gradientColors,
        ),
      ),
    );
  }
}

class CardBox extends StatelessWidget {
  final AssetImage image;
  final String text;
  final double width;
  final double height;
  final List<Color> gradientColors;
  final Color textColor;
  final void Function() onPressed;

  const CardBox({
    required this.image,
    required this.text,
    required this.width,
    required this.height,
    this.gradientColors = const [],
    this.textColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 20, color: textColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
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