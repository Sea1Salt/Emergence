import 'package:flutter/material.dart';
import 'package:project2b/Screen/AdminMenu.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(LoginScreenApp());
}

class LoginScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
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
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 125, 10, 10),
                const Color.fromARGB(255, 0, 0, 0)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('EMERGENCE', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/ambu_png.png', // Ensure you have the white logo in assets
              color: Color.fromARGB(
                  255, 255, 255, 255), // Set the image color to white
            ),
          ),
        ],
      ),
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
                      prefixIcon: Icon(Icons.email,
                          color: Color.fromARGB(255, 125, 10, 10)),
                      labelText: 'E-mail',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 10.0),
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
                      prefixIcon: Icon(Icons.lock,
                          color: Color.fromARGB(255, 125, 10, 10)),
                      labelText: 'Password',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    validator: _validatePassword,
                  ),
                  SizedBox(height: 10),
                  // Login Button with gradient and icon
                  GradientButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print('Username: ${_emailController.text}');
                        print('Password: ${_passwordController.text}');
                        Text('Login');
                        // try {
                        //   var ab = await EmergenceService.Authen();
                        //   print("Result.......");
                        //   print(ab);
                        // } catch (err) {}
                        try {
                          var result = await EmergenceService.Authen(
                              _emailController.text, _passwordController.text);
                          print(result);
                          if (result.isAuthen!) {
                            if (result.role!) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AdminMenu();
                              }));
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MainScreen();
                              }));
                            }
                          } else {
                            print("wrong password");
                            InvalidPopup(context);
                          }
                        } catch (err) {}
                      }
                    },
                    width: 400, // Custom width
                    height: 50, // Custom height
                    colors: [
                      Color.fromARGB(255, 125, 10, 10),
                      const Color.fromARGB(255, 0, 0, 0),
                    ],
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.login, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  // Create New Account
                  TextButton(
                    onPressed: () {
                     Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
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
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
        borderRadius: BorderRadius.circular(30),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: child,
      ),
    );
  }
}
