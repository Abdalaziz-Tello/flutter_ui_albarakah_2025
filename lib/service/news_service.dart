import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nav_bar_and_splash_screen/model/news_model.dart';

class NewsService {
  static String APIKEY = "d3e93a2e25df49e4aaea1b30c320d0a6";
  late Response response;
  String baseurl =
      "https://newsapi.org/v2/everything?q=tesla&from=2025-04-05&sortBy=publishedAt&apiKey=$APIKEY";
  Dio dio = Dio();

  Future<List<NewsModel>> getNews() async {
    try {
      response = await dio.get(baseurl);
      List<NewsModel> news = [];

      for (var i = 0; i < response.data['articles'].length; i++) {
        news.add(NewsModel.fromMap(response.data['articles'][i]));
      }
      return news;
      
    } catch (e) {
      print(e);
      return [];
    }
  }
}
