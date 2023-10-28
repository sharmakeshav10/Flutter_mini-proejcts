import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreen = 'home-screen';

  // @override
  // void initState() {
  //   activeScreen = HomeScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromRGBO(120, 226, 161, 1),
                // Color.fromRGBO(161, 172, 165, 1)
                Color.fromRGBO(24, 4, 82, 1),
                Color.fromRGBO(161, 172, 165, 1),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: activeScreen == 'home-screen'
              ? HomeScreen(switchScreen)
              : const QuestionScreen(),
        ),
      ),
    );
  }
}
