import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/controller.dart';

class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Total',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Obx(() => Text('RS' + ' ' + controller.total))
        ],
      ),
    );
  }
}
