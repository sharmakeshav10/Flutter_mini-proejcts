import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: Colors.black, brightness: Brightness.dark);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
      ),
      theme: ThemeData().copyWith(
          useMaterial3: true, textTheme: ThemeData().textTheme.copyWith()),
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    );
  }
}
