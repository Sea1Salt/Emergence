import 'package:flutter/material.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ProfileBody(),
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late Profile model = Profile();
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      model = await EmergenceService.GetPatient();
      setState(() {});
      print("log");
      print(model.firstname);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                'assets/profile_picture.jpg'), // Add your profile picture asset path here
          ),
          SizedBox(height: 20),
          Text(
            model.firstname,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            model.lastname,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Nickname: JD',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
