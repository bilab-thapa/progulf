import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/utils/proximity.dart';
import 'package:progulf/widgets/all_product_view.dart';
import 'package:progulf/widgets/categories.dart';
import 'package:progulf/widgets/product.dart';
import '../../utils/controller.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  var size, height, width;
  final UserName uname = Get.put(UserName());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/about');
                    },
                    icon: Icon(
                      Icons.cyclone_sharp,
                      size: 35,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    'ProGulf',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/map');
                    },
                    icon: Icon(
                      Icons.info,
                      size: 35,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              //const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: height * 0.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrange,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome" + " " + uname.userName.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "What are you looking for today?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ]),
                  ),
                ),
              ),
              Text(
                'Categories',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Category(),
              const SizedBox(height: 20),
              SizedBox(
                height: 30,
                width: 60,
                child: Proximity(),
              ),
              const SizedBox(height: 10),
              Text(
                'Popular Picks',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              SizedBox(
                height: 300,
                child: ProductAll(),
              ),
              SizedBox(height: 10),
              Text(
                'All Products',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              ProductView(),
            ],
          ),
        ),
      ),
    );
  }
}
