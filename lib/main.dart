import 'package:animation_session/view/implici_page/container_page.dart';
import 'package:animation_session/view/implici_page/home_page_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HealineTextPage(),
    );
  }
}

