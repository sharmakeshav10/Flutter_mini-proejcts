import 'dart:io';

import 'package:flutter/material.dart';
import 'package:navigation_practice/about_screen.dart';
import 'package:navigation_practice/battery_info_screen.dart';
import 'package:navigation_practice/device_info_screen.dart';
import 'package:device_info/device_info.dart';
import 'package:battery/battery.dart';

Future<Map<String, dynamic>> getDeviceData() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return {
      'Device': androidInfo.model,
      'ID': androidInfo.androidId,
      'Platform': 'Android',
    };
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return {
      'Device': iosInfo.name,
      'ID': iosInfo.identifierForVendor,
      'Platform': 'iOS',
    };
  }
  return {'Device': 'Unknown', 'ID': 'Unknown', 'Platform': 'Unknown'};
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ));
              },
              child: Text('About'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceInfoScreen(),
                    ));
              },
              child: Text('Device Info'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BatteryInfoScreen(),
                    ));
              },
              child: Text('Battery Info'),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => ))
            }, child: Text('Show Sensor Info'))
          ],
        ),
      ),
    );
  }
}
