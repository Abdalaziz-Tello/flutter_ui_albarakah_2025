import 'package:dio/dio.dart';
import 'package:quiz_app_full_function/model/quiz_model.dart';

class QuizService {
  Dio dio = Dio();
  String baseUrl = "https://676bde06bc36a202bb85fc11.mockapi.io/Quiz/";
  late Response response;

  Future<QuizModel?> getOneQuiz(String id) async {
    try {
      response = await dio.get(baseUrl + id);
      QuizModel quiz = QuizModel.fromMap(response.data);
      return quiz;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<QuizModel>> getAllQuiz() async {
    try {
      response = await dio.get(baseUrl);
      List<QuizModel> quizList = List.generate(
        response.data.length,
        (index) => QuizModel.fromMap(response.data[index]),
      );
      return quizList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  createNewQuiz(QuizModel quiz) async {
    try {
      print(quiz.toMap());
      response = await dio.post(baseUrl, data: quiz.toMap());
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
