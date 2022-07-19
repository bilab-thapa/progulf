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
      () => SizedBox(
        height: 650,
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
    );
  }
}

class CartProductScreen extends StatelessWidget {
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
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'http://10.0.2.2:8080/' + product.image.toString()),
          ),
          SizedBox(width: width * 0.1),
          Text(
            product.name.toString(),
          ),
          SizedBox(width: width * 0.2),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: Icon(Icons.remove_circle)),
          Text(quantity.toString()),
          IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
