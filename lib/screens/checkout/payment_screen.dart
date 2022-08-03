import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
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
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        SizedBox(height: 50),
        Text(
          'Select Your Locaiton',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        ListTile(
          title: const Text(
            'Chabhail',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          leading: Radio(
            value: 'chabhail',
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
          title: const Text(
            'Jorpati',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          leading: Radio(
            value: 'jorpati',
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
          title: const Text(
            'Kapan',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          leading: Radio(
            value: 'kapan',
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
          title: const Text(
            'Dillibazar',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          leading: Radio(
            value: 'dillibazar',
            groupValue: _site,
            onChanged: (value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        SizedBox(height: 100),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
              onPressed: () {
                if (_site != null) {
                  Get.to(() => Success());
                }
              },
              child: Text(
                'Confirm the Order',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
        )
      ]),
    );
  }
}

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: CardFormField(
        controller: CardFormEditController(),
      ),
    );
  }
}
