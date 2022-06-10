import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: height * 0.07),
                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    height: height * 0.4,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Color(0xffE0FBFC),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.05),
                        Row(
                          children: [
                            SizedBox(width: width * 0.02),
                            CircleAvatar(
                              backgroundColor: Color(0xffFF5733),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: width * 0.04),
                            SizedBox(
                              width: width * 0.6,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.04),
                        Row(
                          children: [
                            SizedBox(width: width * 0.02),
                            CircleAvatar(
                              backgroundColor: Color(0xffFF5733),
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: width * 0.04),
                            SizedBox(
                              width: width * 0.6,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.04),
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.7,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushNamed('/home');
                              } else {
                                return null;
                              }
                            },
                            child: Text(
                              'Sign In',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                              shape: (RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(color: Colors.indigo),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/forgot');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Text(
                      'New around here? Join Us',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
