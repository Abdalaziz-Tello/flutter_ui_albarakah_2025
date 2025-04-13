import 'package:depcency_of_app/core/config/service_locater.dart';
import 'package:flutter/material.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: 
      Text(sl.get<DateTime>().second.toString(),style: TextStyle(fontSize: 32),),),
    );
  }
}