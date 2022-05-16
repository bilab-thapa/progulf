import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  'Register',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Container(
                  height: height * 0.41,
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
                              Icons.email,
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
                      SizedBox(height: height * 0.02),
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
                                hintText: 'Name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
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
                      SizedBox(height: height * 0.04),
                      SizedBox(
                        height: height * 0.07,
                        width: width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Register',
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
                SizedBox(height: height * 0.04),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Text(
                  'Register with',
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
