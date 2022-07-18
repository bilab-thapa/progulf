import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var items = 1.obs;

  increament() {
    items.value++;
  }

  decreament() {
    if (items.value > 1) {
      items.value--;
    } else {
      Get.snackbar("Product", "Cannot Buy less than 1");
      Icon(Icons.alarm);
      BlurStyle.normal;
      Duration(seconds: 3);
    }
  }
}

// class ControllerP extends GetxController {
//   List<String> product = ['a'];

//   increament(name) {
//     product + [name];
//   }

//   containCheck(name) {
//     product.contains(name);
//     // debugPrint(product.toString());
//   }
// }
