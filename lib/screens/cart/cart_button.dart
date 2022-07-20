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
    return Column(
      children: [
        CartProduct(),
        controller.product != null
            ? Container(
                height: 100,
                width: double.infinity,
                child: CartTotal(),
              )
            : Text('no element')
      ],
    );
  }
}
