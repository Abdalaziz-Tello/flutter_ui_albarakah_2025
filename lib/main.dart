import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/helper/checker.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/view/remote_data_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RemoteDataPage(),
    );
  }
}

class QuizPage extends StatelessWidget with HelperForQuiz {
  QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true,title: Text(counter.toString()),),
      body: PageView.builder(
        controller: controller,
        itemCount: quiz.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                trailing: Text(
                  counter.toString(),
                  style: TextStyle(fontSize: 23),
                ),
                title: Text(quiz[index].questionText),
                subtitle: Text("Quetion Number # ${index + 1}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 500,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: quiz[index].options.length,
                    itemBuilder:
                        (context, ind) => InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            print(quiz[index].toJson());
                            checkTheAnswer(
                              index: index,
                              ind: ind,
                              context: context,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue.shade200,
                            ),
                            child: Center(
                              child: Text(quiz[index].options[ind].answerText),
                            ),
                          ),
                        ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LosePage extends StatelessWidget {
  LosePage({super.key});

  bool isPlatformOnBrowser = kIsWeb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, boxSize) {
            // if (isPlatformOnBrowser) {
            //   return CircularProgressIndicator();
            // } else {
            return Text(
              "Sorry you are Loser ${boxSize.maxWidth}",
              style: TextStyle(fontSize: 40),
            );
            // }
          },
        ),
      ),
    );
  }
}
