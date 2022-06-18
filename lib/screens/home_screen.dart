import 'package:flutter/material.dart';
import 'package:progulf/widgets/categories.dart';
import 'package:progulf/widgets/product.dart';

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
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Row(
            children: [
              SizedBox(width: width * 0.35),
              Text(
                'ProGulf',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: width * 0.2,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/map');
                  },
                  icon: Icon(
                    Icons.info,
                    size: 30,
                    color: Colors.lightBlue,
                  ))
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                height: height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 110),
                    Text(
                      'Search',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
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
            Product(),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
