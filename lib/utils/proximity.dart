import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import '../screens/head/mapzone.dart';

class Proximity extends StatefulWidget {
  const Proximity({Key? key}) : super(key: key);

  @override
  State<Proximity> createState() => _ProximityState();
}

class _ProximityState extends State<Proximity> {
  double _proximity = 0;
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    _streamSubscription.add(proximityEvents!.listen((ProximityEvent event) {
      setState(() {
        _proximity = event.proximity;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _proximity >= 90
          ? Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
                  onPressed: () => Get.to(const MapZone()),
                  child: const Text('Map')),
            )
          : Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, elevation: 0),
                  onPressed: () {},
                  child: const Text('Map')),
            ),
    );
  }
}
