import 'package:flutter/material.dart';
import 'package:project2b/Screen/login.dart';
import 'package:project2b/Service/EmergenceService.dart';

void main() {
  runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pidController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200, // Set the desired width
                height: 200, // Set the desired height
                child: Image.asset(
                  "assets/images/login.png",
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Register",
                style: TextStyle(
                    fontSize: 40, color: Color.fromARGB(255, 111, 66, 192)),
              ),
              TextFormField(
                controller: _pidController,
                decoration: const InputDecoration(
                  labelText: 'ID Number',
                  hintText: '13 Digits',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add email format validation here
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  // You can add password strength validation here
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _confirmPassword = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              // TextFormField(
              //     controller: _confirmPasswordController,
              //     decoration: const InputDecoration(
              //       labelText: 'Confirm Password',
              //       icon: Icon(Icons.lock),
              //     ),
              //     obscureText: true,
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Please enter your password';
              //       }
              //       else if (value != _password) {
              //         return 'Passwords do not match';
              //       }
              //       else if (value == _password) {
              //         Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //         return LoginPage();
              //       }));
              //       }

              //       return null;
              //     },
              //     onChanged: (value) {
              //       setState(() {
              //         _confirmPassword = value;
              //       });
              //     }),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('Username: ${_pidController.text}');
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                    var result = await EmergenceService.Regis(
                        _pidController.text,
                        _emailController.text,
                        _passwordController.text);
                    print(result);
                    if (result) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    } else {}
                  }
                },
                child: const Text('Register'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 253, 253, 253)),
                  elevation:
                      MaterialStateProperty.all<double>(10), // Adjust elevation
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 140),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Adjust border radius
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
