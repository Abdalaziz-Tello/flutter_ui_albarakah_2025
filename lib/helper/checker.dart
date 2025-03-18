
import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/model/quiz_model.dart';

mixin HelperForQuiz {


  List<QuizModel> quiz = [
    QuizModel(
      questionText: "What is Your Name ?",
      options: [
        Answer(answerText: "Abd", isCorrcet: true),
        Answer(answerText: "Ahmad", isCorrcet: false),
        Answer(answerText: "Tello", isCorrcet: true),
        Answer(answerText: "Sara", isCorrcet: false),
      ],
    ),
    QuizModel(
      questionText: "What is Your Name ?",
      options: [
        Answer(answerText: "Abd", isCorrcet: true),
        Answer(answerText: "Ahmad", isCorrcet: false),
        Answer(answerText: "Tello", isCorrcet: true),
        Answer(answerText: "Sara", isCorrcet: false),
      ],
    ),
    QuizModel(
      questionText: "What is Your Name ?",
      options: [
        Answer(answerText: "Abd", isCorrcet: true),
        Answer(answerText: "Ahmad", isCorrcet: false),
        Answer(answerText: "Tello", isCorrcet: true),
        Answer(answerText: "Sara", isCorrcet: false),
      ],
    ),
    QuizModel(
      questionText: "What is Your Name ?",
      options: [
        Answer(answerText: "Abd", isCorrcet: true),
        Answer(answerText: "Ahmad", isCorrcet: false),
        Answer(answerText: "Tello", isCorrcet: true),
        Answer(answerText: "Sara", isCorrcet: false),
      ],
    ),

    QuizModel(
      questionText: "What is Your Name ?",
      options: [
        Answer(answerText: "Abd", isCorrcet: true),
        Answer(answerText: "Ahmad", isCorrcet: false),
        Answer(answerText: "Tello", isCorrcet: true),
        Answer(answerText: "Sara", isCorrcet: false),
      ],
    ),
  ];

 PageController controller = PageController();
  int counter = 0;


 checkTheAnswer({
  required int index,
  required int ind,
  required BuildContext context,

}) {
  if (quiz[index].options[ind].isCorrcet) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text("YEEEEEEEEEEEEEEEEE"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
    controller.nextPage(
      duration: Duration(seconds: 2),
      curve: Curves.bounceOut,
    );
    counter++;
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text("Noooo , You Missed Up !!"),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
    counter--;
  }
  if (counter < 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LosePage()),
    );
  }
}

}