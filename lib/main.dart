import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// abstract class A {
//   String some(String name);
// }

// class B extends A {
//   @override
//   String some() {
//     return "";
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        bottomNavigationBar: Text("Hello World"),
        body: Center(child: FlutterLogo(size: 200)),
        floatingActionButton: FlutterLogo(size: 300),
      ),
    );
  }
}
