import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nav_bar_and_splash_screen/model/news_model.dart';
import 'package:nav_bar_and_splash_screen/service/news_service.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Maps")));
  }
}

class MailPage extends StatelessWidget {
  const MailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Mail")));
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsModel> news = [];
  List<NewsModel> searchResult = [];

  // @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 6), () async {
  //     news = await NewsService().getNews();
  //   });
  //   if (news.isNotEmpty) {
  //     print(news);
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            news.where((element) => element.author != null).forEach((element) {
              if (element.author!.startsWith(value)) {
                searchResult.add(element);
              }
            });
            news.clear();
            news = searchResult;
            setState(() {});
          },
        ),
        ElevatedButton(
          onPressed: () async {
            news = await NewsService().getNews();
            setState(() {});
          },
          child: Text("get news"),
        ),

        Container(
          height: 500,
          child:
              news.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    itemCount: news.length,
                    itemBuilder:
                        (context, index) => ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                              news[index].urlToImage ?? "",
                              errorBuilder: (context, error, stackTrace) {
                                return FlutterLogo();
                              },
                            ),
                          ),
                          title: Text(news[index].title ?? "Hello"),
                        ),
                  ),
        ),
      ],
    );
  }
}
