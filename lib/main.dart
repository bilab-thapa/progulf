import 'package:flutter/material.dart';
import 'package:progulf/screens/forgotpw.dart';
import 'package:progulf/screens/home_screen.dart';

import 'package:progulf/screens/login.dart';
import 'package:progulf/screens/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/home': (context) => HomeScreen(),
      '/login': (context) => Login(),
      '/register': (context) => Register(),
      '/forgot': (context) => ForgotPassword(),
    },
  ));
}
