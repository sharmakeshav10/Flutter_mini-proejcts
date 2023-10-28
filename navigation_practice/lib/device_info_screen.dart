import 'package:flutter/material.dart';
import 'package:navigation_practice/home_screen.dart';

class DeviceInfoScreen extends StatefulWidget {
  @override
  _DeviceInfoScreenState createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  Map<String, dynamic> deviceData = {};

  @override
  void initState() {
    super.initState();
    getDeviceData().then((data) {
      setState(() {
        deviceData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: deviceData.keys.map((key) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$key: ${deviceData[key]}'),
            );
          }).toList(),
        ),
      ),
    );
  }
}
