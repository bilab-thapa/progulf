import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/model/product.dart';
import 'package:progulf/utils/controller.dart';

class CartProduct extends StatelessWidget {
  final CartController controller = Get.find();
  CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView.builder(
              itemCount: controller.product.length,
              itemBuilder: (BuildContext context, int index) {
                return CartProductScreen(
                  controller: controller,
                  product: controller.product.keys.toList()[index],
                  quantity: controller.product.values.toList()[index],
                  index: index,
                );
              }),
        ),
      ),
    );
  }
}

class CartProductScreen extends StatelessWidget {
  final host = 'http://127.0.0.1:8080/';
  // final host = 'http://10.0.2.2:8080/';
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  var size, height, width;
  CartProductScreen(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 0, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(host + product.image.toString()),
          ),
          // SizedBox(width: width * 0.1),
          SizedBox(
            height: 60,
            width: 100,
            child: Text(
              product.name.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // SizedBox(width: width * 0.2),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: Icon(
                Icons.remove_circle,
                size: 30,
                color: Colors.red,
              )),
          Text(
            quantity.toString(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
