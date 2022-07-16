import 'package:flutter/material.dart';
import 'package:progulf/widgets/categories.dart';
import 'package:progulf/widgets/product.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  var size, height, width;

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
                  height: height * 0.17,
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
                            "Welcome Bilab",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "What are you looking for today?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          )
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
              Text(
                'Popular Picks',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Container(
                height: height * 0.35,
                width: double.infinity,
                child: ProductAll(),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
