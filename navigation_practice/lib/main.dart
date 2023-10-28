import 'package:flutter/material.dart';
import 'package:navigation_practice/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
