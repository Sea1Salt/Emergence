import 'package:flutter/material.dart';
import 'package:project2b/Emergence2.0/BrokenArm.dart';
import 'package:project2b/Emergence2.0/MainMenu2.0.dart';
import 'package:project2b/Emergence2.0/Profile2.0.dart';
import 'package:project2b/FirstAid/BrokenArm.dart';
import 'package:project2b/FirstAid/BrokenHead.dart';
import 'package:project2b/FirstAid/CPR.dart';
import 'package:project2b/FirstAid/Drowning.dart';
import 'package:project2b/FirstAid/Faint.dart';
import 'package:project2b/FirstAid/Scald.dart';
import 'package:project2b/FirstAid/Seizures.dart';

void main() {
  runApp(MaterialApp(
    home: FirstAidScreen2(),
  ));
}

class FirstAidScreen2 extends StatefulWidget {
  @override
  _FirstAidScreenState createState() => _FirstAidScreenState();
}

class _FirstAidScreenState extends State<FirstAidScreen2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
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

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/EMG2.0.jpg'),
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
              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return buildAnimatedCardBox(
                    width: 200,
                    height: 200,
                    image: AssetImage('assets/images/${index + 1}.jpg'),
                    text: getTextForIndex(index),
                    textColor: const Color.fromARGB(255, 0, 0, 0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => getScreenForIndex(index),
                        ),
                      );
                    },
                    gradientColors: getGradientColorsForIndex(index),
                  );
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SizedBox(
          height: 65, // Set a specific height for the BottomAppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBottomAppBarItem(context, Icons.settings, 'Settings', () {
                // Navigate to settings screen or perform settings-related action
              }),
              buildBottomAppBarItem(context, Icons.search, 'Search', () {
                // Perform search action
              }),
              buildBottomAppBarItem(context, Icons.home, 'Home', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen2()),
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
                  MaterialPageRoute(builder: (context) => ProfileNewScreen2()),
                );
              }),
            ],
          ),
        ),
      ),
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
          width: 170,
          height: 80,
          image: image,
          text: text,
          textColor: const Color.fromARGB(255, 0, 0, 0),
          onPressed: onPressed,
          gradientColors: gradientColors,
        ),
      ),
    );
  }

  String getTextForIndex(int index) {
    switch (index) {
      case 0:
        return 'Broken Arm or Leg';
      case 1:
        return 'Broken Head';
      case 2:
        return 'Faint';
      case 3:
        return 'Scald';
      case 4:
        return 'CPR';
      case 5:
        return 'Drowning';
      case 6:
        return 'Seizures';
      default:
        return '';
    }
  }

  Widget getScreenForIndex(int index) {
    switch (index) {
      case 0:
        return BrokenArmScreen2();
      case 1:
        return BrokenHeadScreen();
      case 2:
        return FaintScreen();
      case 3:
        return ScaldScreen();
      case 4:
        return CPRScreen();
      case 5:
        return DrowningScreen();
      case 6:
        return SeizuresScreen();
      default:
        return BrokenArmScreen();
    }
  }

  List<Color> getGradientColorsForIndex(int index) {
    switch (index) {
      case 0:
        return [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 224, 73, 73),
        ];
      case 1:
        return [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 224, 146, 73),
        ];
      case 2:
        return [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 221, 224, 73),
        ];
      case 3:
        return [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
        ];
      case 4:
        return [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 73, 224, 211),
        ];
      case 5:
        return [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 73, 121, 224),
        ];
      case 6:
        return [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 151, 73, 224),
        ];
      default:
        return [];
    }
  }
}

class CardBox extends StatelessWidget {
  final double width;
  final double height;
  final AssetImage image;
  final String text;
  final Color textColor;
  final void Function() onPressed;
  final List<Color> gradientColors;

  CardBox({
    required this.width,
    required this.height,
    required this.image,
    required this.text,
    required this.textColor,
    required this.onPressed,
    this.gradientColors = const [],
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * 0.9, // Adjusted width
              height: height * 0.82, // Adjusted height
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.transparent, // Initially set to transparent
                ),
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
          width:
              45, // Ensure width and height are the same for a perfect circle
          height: 45,
          decoration: BoxDecoration(
              //  shape: BoxShape.circle,
              //  color: isHome ? Colors.white : Colors.transparent,
              //  border: isHome ? Border.all(color: Colors.white, width: 2) : null,
              ),
          child: IconButton(
            icon: Icon(icon,
                color: isHome
                    ? Color.fromARGB(255, 125, 10, 10)
                    : Color.fromARGB(255, 125, 10, 10),
                size: 30),
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: 0), // Spacing between icon and text
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Faustina', // Use the Faustina font family
            color: Color.fromARGB(255, 125, 10, 10),
            fontSize: 10, // Adjust font size as needed
          ),
        ),
      ],
    ),
  );
}
