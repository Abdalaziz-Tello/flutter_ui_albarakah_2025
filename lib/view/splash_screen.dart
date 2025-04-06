import 'package:flutter/material.dart';
import 'package:nav_bar_and_splash_screen/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 34, 74),
      body: Center(child: Image.asset('assets/images/mic_logo.png')),
    );
  }
}
