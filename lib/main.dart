import 'package:flutter/material.dart';
import 'package:progulf/screens/home_screen.dart';
import 'package:progulf/screens/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': ((context) => const HomeScreen()),
      '/login': ((context) => Login()),
    },
  ));
}
