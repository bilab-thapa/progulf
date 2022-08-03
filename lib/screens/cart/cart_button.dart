import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/screens/cart/cart.dart';
import 'package:progulf/screens/cart/cart_total.dart';

import '../../utils/controller.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.find();
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        automaticallyImplyLeading: false,
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartProduct(),
            CartTotal(),
          ],
        ),
      ),
    );
  }
}
