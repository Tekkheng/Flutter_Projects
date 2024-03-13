class QuizModels {
  const QuizModels(this.title, this.answers);
  final String title;
  final List<String> answers;

  List<String> get shuffleAnswers {
    final List<String> newData = List.of(answers);
    newData.shuffle();
    return newData;
  }
}
