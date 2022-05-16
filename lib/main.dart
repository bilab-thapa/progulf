import 'package:flutter/material.dart';
import 'package:progulf/screens/home_screen.dart';
import 'package:progulf/screens/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/': ((context) => HomeScreen()),
      '/login': ((context) => Login()),
    },
  ));
}
