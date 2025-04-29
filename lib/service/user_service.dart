import 'package:dio/dio.dart';
import 'package:profile_solutaion/model/user_model.dart';


class UserService {
  final Dio dio = Dio();

  Future<User> fetchRandomUser() async {
    final response = await dio.get('https://randomuser.me/api/');
    final data = response.data['results'][0];
    return User.fromJson(data);
  }
}
