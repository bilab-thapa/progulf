import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:progulf/model/user.dart';
import 'package:progulf/repository/user_repository.dart';
import 'package:progulf/utils/show_message.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _registerUser(User user) async {
    bool isSignup = await UserRepository().registerUser(user);
    if (isSignup) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isSignup) {
    if (isSignup) {
      displaySuccessMessage(context, "Register Success");
    } else {
      displayErrorMessage(context, 'Register Failed');
    }
  }

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
                    'Register',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    height: height * 0.5,
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
                                controller: _emailController,
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
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
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
                                controller: _passwordController,
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
                        SizedBox(height: height * 0.02),
                        SizedBox(width: width * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  _loadImage(ImageSource.camera);
                                },
                                child: Text('Camera')),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: ClipRRect(
                                child: _displayImage(),
                              ),
                              radius: width * 0.08,
                            ),
                            TextButton(
                                onPressed: () {
                                  _loadImage(ImageSource.gallery);
                                },
                                child: Text('Gallery')),
                          ],
                        ),
                        SizedBox(height: height * 0.04),
                        SizedBox(
                          height: height * 0.07,
                          width: width * 0.7,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                User user = User(
                                  email: _emailController.text,
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                );
                                _registerUser(user);
                              } else {
                                return null;
                              }
                            },
                            child: Text(
                              'Register',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayImage() {
    return Center(
      child: img == null
          ? Icon(
              Icons.image,
              color: Colors.grey,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                img!,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
