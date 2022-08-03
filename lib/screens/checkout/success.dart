import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progulf/widgets/bottom_navigation.dart';

import '../../utils/controller.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: NetworkImage(
                    'https://res.cloudinary.com/bilabthapa/video/upload/v1659286017/progulf/success/videoplayback_hlrrgn.mp4'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Successfully Placed the Order",
            style: TextStyle(
                fontSize: 28,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                AwesomeNotifications().createNotification(
                  content: NotificationContent(
                    channelKey: 'Basic',
                    id: 1,
                    title: 'ProGulf',
                    body: 'Order Placed Successfully',
                  ),
                );
                controller.clearProduct();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  ),
                );
              },
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Proceed to Home Screen',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Icon(
                      Icons.next_plan,
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
