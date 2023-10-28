import 'dart:async';

import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:navigation_practice/home_screen.dart';

class BatteryInfoScreen extends StatefulWidget {
  @override
  _BatteryInfoScreenState createState() => _BatteryInfoScreenState();
}

class _BatteryInfoScreenState extends State<BatteryInfoScreen> {
  final battery = Battery();
  int batteryLevel = 100;
  BatteryState batteryState = BatteryState.full;

  late Timer timer;
  late StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    listenBatteryLevel();
    listenBatteryState();
  }

  void listenBatteryLevel() {
    updateBatteryLevel();

    timer = Timer.periodic(Duration(seconds: 10), (_) async {
      updateBatteryLevel();
    });
  }

  void listenBatteryState() {
    subscription = battery.onBatteryStateChanged.listen((batteryState) {
      setState(() {
        this.batteryState = batteryState;
      });
    });
  }

  Future updateBatteryLevel() async {
    final batteryLevel = await battery.batteryLevel;

    setState(() {
      this.batteryLevel = batteryLevel;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Battery State: $batteryState'),
            Text('Battery Level: $batteryLevel')
          ],
        ),
      ),
    );
  }
}
