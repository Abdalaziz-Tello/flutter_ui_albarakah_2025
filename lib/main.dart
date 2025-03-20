import 'package:flutter/material.dart';
import 'package:quiz_app_full_function/model/quiz_model.dart';
import 'package:quiz_app_full_function/service/quiz_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizPage());
  }
}

class QuizForOneQuestionPage extends StatelessWidget {
  const QuizForOneQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: QuizService().getOneQuiz("1"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            QuizModel quiz = snapshot.data!;
            return Column(
              children: [
                ListTile(title: Text(quiz.quistionText)),
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    itemCount: quiz.options.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder:
                        (context, index) => Container(
                          child: InkWell(
                            onTap: () {
                              if (quiz.options[index].isCorrect) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Correct")),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Incorrect")),
                                );
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(quiz.options[index].answerText),
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  QuizPage({super.key});
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CircularProgressIndicator(
          value: 0.5,
        ),
      ),
      body: FutureBuilder(
        future: QuizService().getAllQuiz(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QuizModel> quizes = snapshot.data!;
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              itemCount: quizes.length,
              itemBuilder:
                  (context, index) => Column(
                    children: [
                      ListTile(title: Text(quizes[index].quistionText)),
                      SizedBox(
                        height: 500,
                        child: GridView.builder(
                          itemCount: quizes[index].options.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                          itemBuilder:
                              (context, ind) => Container(
                                child: InkWell(
                                  onTap: () {
                                    if (index == quizes.length - 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddQuizPage(),
                                        ),
                                      );
                                    }
                                    if (quizes[index].options[ind].isCorrect) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text("Correct")),
                                      );
                                      controller.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    } else {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text("Incorrect")),
                                      );
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      quizes[index].options[ind].answerText,
                                    ),
                                  ),
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class AddQuizPage extends StatelessWidget {
  AddQuizPage({super.key});
  TextEditingController question = TextEditingController();

  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  TextEditingController answer4 = TextEditingController();
  TextEditingController indexOfCorrect = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: question,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: answer1,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: answer2,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: answer3,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: answer4,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  // enabled: false,
                  controller: indexOfCorrect,
                  onChanged: (value) {
                    // print(value);
                    // print(controller.text);
                  },
                  // obscureText: true,
                  // dragStartBehavior: DragStartBehavior.start,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your question',
                    helperText: 'Enter Helper',
                    labelText: 'Enter Label',

                    // fillColor: Colors.red,
                    // filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            // this is a container like button with good decoration
            InkWell(
              onTap: () {
                List<Options> options = [];
                if (int.parse(indexOfCorrect.text) >= 0 &&
                    int.parse(indexOfCorrect.text) < 4) {
                  options = [
                    Options(answerText: answer1.text, isCorrect: false),
                    Options(answerText: answer2.text, isCorrect: false),
                    Options(answerText: answer3.text, isCorrect: false),
                    Options(answerText: answer4.text, isCorrect: false),
                  ];
                  for (int i = 0; i < 4; i++) {
                    if (i == int.parse(indexOfCorrect.text)) {
                      options[i].isCorrect = true;
                    }
                  }
                }
                QuizModel quiz = QuizModel(
                  quistionText: question.text,
                  options: options,
                );
                QuizService().createNewQuiz(quiz);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),

                width: 300,
                height: 54,
                child: Center(child: Text('Click me')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
