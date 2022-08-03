import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/screens/checkout/payment_screen.dart';
import 'package:progulf/utils/payment_controller.dart';
import 'package:progulf/widgets/bottom_navigation.dart';

import '../../utils/controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  final PaymentController paymentController = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
          height: 110,
          decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
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
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        if (controller.total == '0') {
                          Get.to(() => BottomNavigation());
                        }
                        Get.to(() => PaymentScreen());
                      },
                      child: Text(
                        controller.total != '0' ? 'Make Payment' : 'Add Items',
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 28),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
