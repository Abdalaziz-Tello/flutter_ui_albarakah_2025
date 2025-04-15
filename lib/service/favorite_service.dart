


import 'package:animation_session/model/fav_model.dart';
import 'package:dio/dio.dart';

Future<bool> addToFavortite(
  FavModel fav_model
)async{
  try {
    Response response = await Dio().post("https://676bde06bc36a202bb85fc11.mockapi.io/favorite",data: fav_model.toMap());
    return true;
  } catch (e) {
    print(e);
    return false;
    
  }
}

Future<List<FavModel>> getFav()async{
  try {
    Response response = await Dio().get("https://676bde06bc36a202bb85fc11.mockapi.io/favorite");
    return List.generate(response.data.length,(index) => FavModel.fromMap(response.data[index]),);
  } catch (e) {
    return [];
  }
}