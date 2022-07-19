import 'package:flutter/material.dart';
import 'package:progulf/screens/category_screen/bike.dart';
import 'package:progulf/screens/category_screen/car.dart';
import 'package:progulf/screens/category_screen/heavy.dart';
import 'package:progulf/screens/category_screen/parts.dart';
import 'package:progulf/screens/category_screen/tempo.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          category.toString().toUpperCase(),
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: category == '2wheelers'
            ? Bike()
            : category == '3wheelers'
                ? Tempo()
                : category == '4wheelers'
                    ? Car()
                    : category == 'heavy'
                        ? Heavy()
                        : Parts(),
      ),
    );
  }
}
