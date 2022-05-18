import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
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
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                              ),
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
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.07),
                      SizedBox(
                        height: height * 0.07,
                        width: width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
                    'New around here? Register',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Text(
                  'Login with',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.04),
                Row(
                  children: [
                    SizedBox(width: width * 0.3),
                    CircleAvatar(
                      child: Icon(Icons.facebook),
                    ),
                    SizedBox(width: width * 0.2),
                    CircleAvatar(
                      child: Icon(Icons.mail_rounded),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
