import 'package:flutter/material.dart';
import 'package:progulf/screens/cart/cart.dart';
import 'package:progulf/screens/cart/cart_total.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartProduct(),
        CartTotal(),
      ],
    );
  }
}
