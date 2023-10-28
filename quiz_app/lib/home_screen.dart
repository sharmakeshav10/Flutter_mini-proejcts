import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz_logo.png',
            width: 150,
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Put your football knowledge to test",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 248, 248, 248)),
          ),
          SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(15),
                foregroundColor: Color.fromARGB(255, 248, 248, 248)),
            icon: const Icon(Icons.sports_soccer),
            label: const Text(
              "Let's play",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 248, 248, 248),
              ),
            ),
          )
        ],
      ),
    );
  }
}
