import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(60),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered these correctly!'),
            const SizedBox(
              height: 20,
            ),
            const Text('List of ques and ans'),
            TextButton(onPressed: () {}, child: Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
