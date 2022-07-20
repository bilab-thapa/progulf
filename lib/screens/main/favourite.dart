import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/controller.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  final UserName uName = Get.put(UserName());

  @override
  void initState() {
    _streamSubscription.add(accelerometerEvents!.listen((event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    super.initState();
    openBox();
  }

  openBox() async {
    await Hive.openBox('favourite' + uName.userName);
  }

  List<double> _accelerometerValues = <double>[];
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    var box2 = Hive.box('favourite' + uName.userName);
    final List<String> accelerometer =
        _accelerometerValues.map((double v) => v.toStringAsFixed(1)).toList();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var x = accelerometer[0];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Favourites',
          style: TextStyle(fontSize: 26),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: box2.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text(
                'Add Some Items to Your Favourites',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var data = box2.getAt(index)!;
                if (double.parse(x) > 20) {
                  box2.clear();
                }
                return Container(
                  margin: EdgeInsets.all(10),
                  height: height * 0.3,
                  width: width * 1,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(
                        height: height * 0.25,
                        child: Image(image: NetworkImage(data.image)),
                      ),
                      SizedBox(width: width * 0.03),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.name,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                          Text(
                            'RS ' + data.price,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.03),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () => box2.deleteAt(index),
                          icon: Icon(
                            Icons.delete,
                            size: 36,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
