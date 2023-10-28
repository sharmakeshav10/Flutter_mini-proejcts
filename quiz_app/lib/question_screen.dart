import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The question'),
          const SizedBox(
            height: 20,
          ),
          AnswerButton(answerText: "ans 1", onTap: () {}),
          AnswerButton(answerText: "ans 2", onTap: () {}),
        ],
      ),
    );
  }
}
