// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class QuizModel {
//   String question;
//   List<Answer> answer;
//   QuizModel({
//     required this.question,
//     required this.answer,
//   });
// }

// class Answer {
//   String answer;
//   bool isCorrect;
//   Answer({
//     required this.answer,
//     required this.isCorrect,
//   });
// }

class QuizModel {
  String question;
  List<String> answers;
  int indexOfCorrectAnswer;
  QuizModel({
    required this.question,
    required this.answers,
    required this.indexOfCorrectAnswer,
  });
}
