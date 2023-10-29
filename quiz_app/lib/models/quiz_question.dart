class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // shuffle directly mutates the original list and we don't want that as we always want our answer to be first option so we create a getShuffledAnswers function
    final shuffledList = List.of(answers);
    shuffledList.shuffle();

    return shuffledList;
  }
}
