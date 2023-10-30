import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.summaryData, super.key});

  final Map<String, Object> summaryData;

  @override
  Widget build(context) {
    final isCorrectAns =
        summaryData['user_answer'] == summaryData['correct_;answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAns: isCorrectAns,
          quesIndex: summaryData['question_index'] as int,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summaryData['question'] as String,
                style: GoogleFonts.nunito(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                summaryData['user_answer'] as String,
                style: GoogleFonts.nunito(
                    color: Color.fromARGB(255, 168, 166, 233),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                summaryData['correct_answer'] as String,
                style: GoogleFonts.nunito(
                    color: Color.fromARGB(255, 95, 214, 121),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
