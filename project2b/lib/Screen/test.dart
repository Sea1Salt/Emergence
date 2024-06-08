import 'package:flutter/material.dart';
import 'package:project2b/Screen/mainmenu.dart';
import 'package:project2b/Screen/register.dart';
import 'package:project2b/Service/EmergenceService.dart';

class MyAppff extends StatelessWidget {
  const MyAppff({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String pwdcheck = '';

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
                "Login",
                style: TextStyle(
                    fontSize: 40, color: Color.fromARGB(255, 111, 66, 192)),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
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
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
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
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return RegisterApp();
                        // }));
                      }
                    } catch (err) {}
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 253, 253, 253)),
                  elevation:
                      MaterialStateProperty.all<double>(10), // Adjust elevation
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Adjust border radius
                    ),
                  ),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 30.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegisterApp();
                        }));
                },
                child: const Text(
                  'Are you Register yet',
                  style: TextStyle(
                    color: Color.fromARGB(255, 111, 66, 192),
                    decoration: TextDecoration.underline,
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
