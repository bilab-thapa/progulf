import 'dart:math';

import 'package:flutter/material.dart';
import 'package:progulf/model/product.dart';
import 'package:progulf/repository/product_repository.dart';
import 'package:progulf/response/get_product_response.dart';

class ProductAll extends StatefulWidget {
  @override
  State<ProductAll> createState() => _ProductAllState();
}

class _ProductAllState extends State<ProductAll> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return FutureBuilder<ProductResponse?>(
      future: ProductRepository().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            List<Product> lstProduct = snapshot.data!.data!;
            List<Product> newList = [];
            for (var a = 0; a < lstProduct.length; a++) {
              if (newList.length <= 6) {
                newList
                    .add(lstProduct[Random().nextInt(lstProduct.length - 1)]);
              } else {
                break;
              }
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed('/productinfo', arguments: newList[index]),
                    child: _productDetail(newList, index));
              },
            );
          } else {
            return const Center(
              child: Text("Data"),
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          );
        }
      },
    );
  }

  _productDetail(newList, index) {
    final host = 'http://127.0.0.1:8080/'; //mobile
    // final host = 'http://10.0.2.2:8080/'; //laptop
    const textStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
    return Container(
      margin: EdgeInsets.all(10),
      width: width * 0.5,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.2,
            width: width * 0.6,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                host + newList[index].image.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(newList[index].name.toString(), maxLines: 1, style: textStyle),
          Text(
            'RS ' + newList[index].price.toString(),
            style: textStyle,
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              newList[index].description.toString(),
              maxLines: 1,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
