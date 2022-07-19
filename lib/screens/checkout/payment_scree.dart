import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/screens/checkout/success.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var value;
  var _site;
  List lables = ['Esewa', 'Khalti', 'Cash On Delivery'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Payment Method'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        SizedBox(height: 50),
        ListTile(
          title: const Text('Esewa'),
          leading: Radio(
            value: 'esewa',
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: const Text('Khalti'),
          leading: Radio(
            value: 'khalti',
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          title: const Text('COD'),
          leading: Radio(
            value: 'cod',
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        SizedBox(height: 200),
        SizedBox(
          height: 40,
          width: 180,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
              onPressed: () {
                Get.to(() => Success());
              },
              child: Text('Pay')),
        )
      ]),
    );
  }
}
