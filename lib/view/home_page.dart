import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Container(
        decoration:  BoxDecoration(
          border: Border.all(style: BorderStyle.none)
        ),
      )),
    );
  }
}
