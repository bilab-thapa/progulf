import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/screens/checkout/payment_scree.dart';

import '../../utils/controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.deepOrange,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Obx(() => Text(
                      'Rs' + ' ' + controller.total,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    )),
              ],
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Get.to(PaymentScreen());
                },
                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 28),
                ),
              ),
            ),
          ],
        ));
  }
}
