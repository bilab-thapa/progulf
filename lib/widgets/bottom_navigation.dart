import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:progulf/screens/cart/cart_button.dart';
import 'package:progulf/screens/main/home_screen.dart';
import 'package:progulf/screens/main/message.dart';
import 'package:progulf/screens/main/profile.dart';

import '../screens/main/favourite.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final navigationkey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final screens = [
    ProfileScreen(),
    MessageScreen(),
    HomeScreen(),
    Favourite(),
    CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 54,
        backgroundColor: Colors.transparent,
        color: Colors.teal,
        buttonBackgroundColor: Colors.deepOrange,
        index: index,
        key: navigationkey,
        items: <Widget>[
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.email,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            this.index = index;
          });
          //Handle button tap
        },
      ),
    );
  }
}
