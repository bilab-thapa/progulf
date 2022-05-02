import 'package:flutter/material.dart';
import 'package:progulf/screens/home_screen.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.red,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image(
                image: AssetImage('assets/2wheel.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.red,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image(
                image: AssetImage('assets/3wheel.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.red,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image(
                image: AssetImage('assets/4wheel.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.red,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image(
                image: AssetImage('assets/hydraulic.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.red,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image(
                image: AssetImage('assets/grease.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Colors.red,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image(
                image: AssetImage('assets/parts.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
