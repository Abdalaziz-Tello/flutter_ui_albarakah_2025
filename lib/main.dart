import 'dart:io';

import 'package:flutter/material.dart';
import 'package:splash_and_onboading/view/home_page.dart';
import 'package:splash_and_onboading/view/on_boarding.dart';

void main() {
  runApp(const MyApp());
}
// TODO : 1-Closure 2-Icon 3-Image.
// TODO : 4-Practice in OnBoarding 5-ViewPadding 6-Controller 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [OnBoardingPage(), HomePage(), HomePage()],
      ),
    );
  }
}
