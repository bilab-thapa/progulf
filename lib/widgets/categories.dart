import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/screens/category_screen/category_items.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: width * 0.03),
          InkWell(
            onTap: () =>
                Get.to(() => (CategoryItems()), arguments: "2wheelers"),
            child: Container(
              height: height * 0.15,
              width: width * 0.3,
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
          ),
          SizedBox(width: width * 0.03),
          InkWell(
            onTap: () =>
                Get.to(() => (CategoryItems()), arguments: "3wheelers"),
            child: Container(
              height: height * 0.15,
              width: width * 0.3,
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
          ),
          SizedBox(width: width * 0.03),
          InkWell(
            onTap: () =>
                Get.to(() => (CategoryItems()), arguments: "4wheelers"),
            child: Container(
              height: height * 0.15,
              width: width * 0.3,
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
          ),
          SizedBox(width: width * 0.03),
          InkWell(
            onTap: () => Get.to(() => (CategoryItems()), arguments: "heavy"),
            child: Container(
              height: height * 0.15,
              width: width * 0.3,
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
          ),
          SizedBox(width: width * 0.03),
          InkWell(
            onTap: () => Get.to(() => (CategoryItems()), arguments: "parts"),
            child: Container(
              height: height * 0.15,
              width: width * 0.3,
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
          ),
          SizedBox(width: width * 0.04),
        ],
      ),
    );
  }
}
