import 'package:dio/dio.dart';
import 'package:quiz_app/model/quiz_model.dart';

class RemoteSource {
  Future<QuizModel?> getData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        "https://676bde06bc36a202bb85fc11.mockapi.io/Quiz/1",
      );

      return QuizModel.fromMap(response.data);
    } catch (e) {
      print(e);
    }
  }
}
