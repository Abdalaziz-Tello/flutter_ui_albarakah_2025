import 'package:flutter/material.dart';
import 'package:navigation_snacknar_context/model/quiz_model.dart';

void main() {
  HomePage h = HomePage.getInstance();

  HomePage h1 = HomePage.getInstance();

  if (h == h1) {
    print("object");
  } else {
    print("Not same");
  }
  runApp(MyApp());
}

// ! : One instance not mean One View or One Screen
HomePage s = HomePage.getInstance();

int coutner = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: s);
  }
}

class SplahScreen extends StatelessWidget {
  const SplahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coutner.toString())),
      body: Container(
        foregroundDecoration: BoxDecoration(
          // color: Colors.yellow.shade100,
          // backgroundBlendMode: BlendMode.softLight,
          // border: Border.all(color: Colors.black, strokeAlign: 10),
          // borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Image.asset("assets/images/frame.png")),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back_frame.png'),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,

            end: Alignment.bottomCenter,
            colors: [Color(0xFFFAD293), Color(0xFFCD7A3C)],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          // Navigator.pop(context);
          coutner++;
          Navigator.push(context, MaterialPageRoute(builder: (context) => s));
        },
        child: FlutterLogo(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage._();

  static HomePage home = HomePage._();

  static getInstance() {
    return home;
  }

  QuizModel quiz = QuizModel(
    question: "How Old Are You ?",
    answers: ["20", "30", "100", "40"],
    indexOfCorrectAnswer: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coutner.toString())),

      // TODO : Make it with multiQuistion
      // body: PageView.builder(
      //   itemCount: ,
      //   itemBuilder:(context, index) => , ),
      body: Center(
        child: InkWell(
          onTap: () {
            coutner++;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplahScreen()),
            );
          },
          child: Column(
            children: [
              ListTile(title: Text(quiz.question)),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: quiz.answers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // maxCrossAxisExtent: 200,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder:
                      (context, inx) => InkWell(
                        onTap: () {
                          if (inx == quiz.indexOfCorrectAnswer) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("YEEEEEEEEEEEEEEEEE"),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.green,
                              ),
                            );
                            // TODO : Add Controller for PageView
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Nooooooooooooooo"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: Center(child: Text(quiz.answers[inx])),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
