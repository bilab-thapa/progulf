import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/widgets/bottom_navigation.dart';

import '../../utils/controller.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(
                      'https://media1.giphy.com/media/xT0xezQGU5xCDJuCPe/giphy.gif?cid=790b761107a4da3f199ed7f862c8bb909a649a8a238f13bf&rid=giphy.gif&ct=g'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Successfully Placed the Order",
            style: TextStyle(
                fontSize: 28,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: ElevatedButton(
                child: Text(
                  'Proceed to Home Screen',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  controller.clearProduct();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BottomNavigation(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
