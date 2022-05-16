import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            height: 210,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.red,
            ),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/test.jpeg'),
                  fit: BoxFit.fill,
                ),
                Text(
                  'RS 200',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 210,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.red,
            ),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/test.jpeg'),
                  fit: BoxFit.fill,
                ),
                Text(
                  'RS 300',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 210,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.red,
            ),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/test.jpeg'),
                  fit: BoxFit.fill,
                ),
                Text(
                  'RS 250',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 210,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.red,
            ),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/test.jpeg'),
                  fit: BoxFit.fill,
                ),
                Text(
                  'RS 270',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 210,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.red,
            ),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/test.jpeg'),
                  fit: BoxFit.fill,
                ),
                Text(
                  'RS 450',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
