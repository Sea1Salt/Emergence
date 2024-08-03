import 'package:flutter/material.dart';
import 'package:project2b/Screen/AdminMenu.dart';
import 'package:project2b/Screen/RegisterNew.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Button%20n%20Bar/popup.dart';
import 'package:project2b/Service/EmergenceService.dart';

// void main() {
//   runApp(LoginScreenApp2());
// }

// class LoginScreenApp2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//       ),
//     );
//   }
// }

class LoginScreenApp2 extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenApp2> {
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
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/EMG2.0.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 70, 25, 30),
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255).withOpacity(.9),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(10, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 15),
                        Icon(
                          Icons.account_circle,
                          size: 100,
                          color: Color.fromARGB(255, 125, 10, 10),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 125, 10, 10),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 125, 10, 10),
                                ),
                                labelText: 'E-mail',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 125, 10, 10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 125, 10, 10)), // Default border color
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 125, 10, 10)), // Border color when enabled
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0,
                                          0)), // Border color when focused
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Colors
                                          .red), // Border color when error
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Colors
                                          .red), // Border color when focused and error
                                ),
                              ),
                              validator: _validateEmail,
                            )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 125, 10, 10),
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 125, 10, 10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 125, 10, 10)), // Default border color
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 125, 10, 10)), // Border color when enabled
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0,
                                          0)), // Border color when focused
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Colors
                                          .red), // Border color when error
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  borderSide: BorderSide(
                                      color: Colors
                                          .red), // Border color when focused and error
                                ),
                              ),
                              validator: _validatePassword,
                            )),
                        SizedBox(height: 5),
                        GradientButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              print('Username: ${_emailController.text}');
                              print('Password: ${_passwordController.text}');
                              try {
                                var result = await EmergenceService.Authen(
                                    _emailController.text,
                                    _passwordController.text);
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
                              } catch (err) {
                                InvalidPopup(context);
                              }
                            }
                          },
                          width: 400,
                          height: 45,
                          colors: [
                            Color.fromARGB(197, 12, 0, 185),
                            Color.fromARGB(214, 167, 0, 0),
                          ],
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.login,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
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
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
    this.height = 42.0,
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
