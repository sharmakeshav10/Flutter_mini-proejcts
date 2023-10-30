import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.isCorrectAns, required this.quesIndex});

  final bool isCorrectAns;
  final int quesIndex;

  @override
  Widget build(context) {
    final quesNumber = quesIndex + 1;
    return Container(
      width: 25,
      height: 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAns
            ? const Color.fromARGB(255, 16, 71, 17)
            : const Color.fromARGB(255, 141, 27, 18),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        quesNumber.toString(),
        style: const TextStyle(
            color: Color.fromARGB(255, 9, 5, 56), fontWeight: FontWeight.bold),
      ),
    );
  }
}
