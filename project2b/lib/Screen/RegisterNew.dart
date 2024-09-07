import 'package:flutter/material.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Screen/LoginNew.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(RegisNewScreen());
}

class RegisNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterNewScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}

class RegisterNewScreen extends StatefulWidget {
  @override
  _RegisterNewScreenState createState() => _RegisterNewScreenState();
}

class _RegisterNewScreenState extends State<RegisterNewScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ID_numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  SizedBox(height: 10),
                  // Title
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 125, 10, 10),
                    ),
                  ),
                  SizedBox(height: 30),
                  // ID Card Field
                  TextFormField(
                    controller: _ID_numberController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.credit_card,
                          color: Color.fromARGB(255, 125, 10, 10)),
                      labelText: 'ID Card',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your ID card';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,
                          color: Color.fromARGB(255, 125, 10, 10)),
                      labelText: 'G-mail',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline,
                          color: Color.fromARGB(255, 125, 10, 10)),
                      labelText: 'Confirm Password',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 13.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _confirmPassword = value;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  // Register Button with gradient color and icon
                  GradientButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print('Username: ${_emailController.text}');
                        print('Password: ${_passwordController.text}');
                        try {
                          var result = await EmergenceService.Regis(
                              _ID_numberController.text,
                              _emailController.text,
                              _passwordController.text);
                          if (result) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenApp(),
                              ),
                            );
                            ConsentPopUp(context);
                          } else {
                            print("Registration failed");
                          }
                        } catch (err) {
                          print(err.toString());
                        }
                      }
                    },
                    width: double.infinity,
                    height: 50,
                    colors: [
                      Color.fromARGB(255, 125, 10, 10),
                      const Color.fromARGB(255, 0, 0, 0),
                    ],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
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
    this.height = 40.0,
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
