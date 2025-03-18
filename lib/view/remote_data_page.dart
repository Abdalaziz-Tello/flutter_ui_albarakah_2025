import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/service/remote_source.dart';

class RemoteDataPage extends StatelessWidget {
  RemoteDataPage({super.key});
  final RemoteSource service = RemoteSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: service.getData(),
          builder: (context, dataState) {
            if (dataState.hasData) {
              //TODO : Add the Quiz Page From Column
              // ? Then :do it with List of Model and PageView
              return Center(child: Text(dataState.data!.questionText));
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
