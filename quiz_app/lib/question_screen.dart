import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: EdgeInsets.all(60),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.nunito(
                  color: Color.fromARGB(255, 216, 228, 238),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            //getShuffled will shuffle our list on every reload but our original list is not mutated
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(answerText: answer, onTap: answerQuestion);
              },
            ),
          ],
        ),
      ),
    );
  }
}
