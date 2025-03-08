class QuestionEntity {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  QuestionEntity({required this.questionText, required this.options, required this.correctAnswer});
}

 List<QuestionEntity> questions = [
   QuestionEntity(
     questionText: "What is the capital of France?",
     options: ["Paris", "London", "Berlin", "Madrid"],
     correctAnswer: "Paris",
   ),
  QuestionEntity(
    questionText: "What is 2 + 2?",
    options: ["3", "4", "5", "6"],
    correctAnswer: "4",
  ),
  QuestionEntity(
    questionText: "What is the color of the sky?",
    options: ["Blue", "Green", "Red", "Yellow"],
    correctAnswer: "Blue",
  ),
];