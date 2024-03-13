class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final List<String> answers;
  final String question;

  List<String> get shuffleAnswers{
    final newList = List.of(answers);
    newList.shuffle();
    return newList;
  }
}
