import 'package:flutter/material.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Screen/popup.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(LoginScreenApp());
}

class LoginScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String pwdcheck = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with login
      // You can add your login logic here
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon at the top
                Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Color.fromARGB(255, 125, 10, 10),
                ),
                SizedBox(height: 20),
                // Title
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 125, 10, 10),
                  ),
                ),
                SizedBox(height: 20),
                // Email Field
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 125, 10, 10)),
                    labelText: 'E-mail',
                    contentPadding: EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  validator: _validateEmail,
                ),
                SizedBox(height: 10),
                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 125, 10, 10)),
                    labelText: 'Password',
                    contentPadding: EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  validator: _validatePassword,
                ),
                SizedBox(height: 20),
                // Login Button
                ElevatedButton(
                  onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('Username: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                    Text('Login');
                    try {
                      var result = await EmergenceService.Authen(
                          _emailController.text, _passwordController.text);
                      if (result) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }));
                      } else {
                        print("wrong password");
                        InvalidPopup(context);
                      }
                    } catch (err) {}
                  }
                }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 125, 10, 10),
                    foregroundColor: Colors.white, // Change text color to white
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(double.infinity, 57),
                    
                  ),
                  child: Text('Login'),
                ),
                SizedBox(height: 15),
                // Create New Account
                TextButton(
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisNewScreen();
                  }));
                },
                  child: Text(
                    'CREATE NEW ACCOUNT',
                    style: TextStyle(
                      color: Color.fromARGB(255, 125, 10, 10),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
