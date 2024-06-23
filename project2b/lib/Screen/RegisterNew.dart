import 'package:flutter/material.dart';
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
                    // Image.asset(
                    //   'assets/images/regis.png', // Ensure you have the image in assets
                    //   height: 150,
                    // ),
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
                    SizedBox(height: 50),
                    // ID Card Field
                    TextFormField(
                      controller: _ID_numberController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.credit_card,
                            color: Color.fromARGB(255, 125, 10, 10)),
                        labelText: 'ID Card',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 10.0),
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
                            vertical: 17.0, horizontal: 10.0),
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
                            vertical: 17.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
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
                            vertical: 17.0, horizontal: 10.0),
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
                    // Register Button
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print('Username: ${_emailController.text}');
                          print('Password: ${_passwordController.text}');
                          Text('Login');
                          try {
                            var result = await EmergenceService.Regis(
                                _ID_numberController.text,
                                _emailController.text,
                                _passwordController.text);
                            if (result) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreenApp();
                              }));
                            } else {
                              print("wrong password");
                            }
                          } catch (err) {}
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 125, 10, 10),
                        foregroundColor:
                            Colors.white, // Change text color to white
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        minimumSize: Size(double.infinity, 57),
                      ),
                      child: Text('Register'),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
