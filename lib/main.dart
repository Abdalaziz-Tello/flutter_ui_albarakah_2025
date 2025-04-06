import 'package:flutter/material.dart';
import 'package:nav_bar_and_splash_screen/view/home_page.dart';
import 'package:nav_bar_and_splash_screen/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.pink,),),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
