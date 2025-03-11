import 'package:controller_in_flutter/view/fixed_home_page.dart';
import 'package:controller_in_flutter/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  // helloWorld(() {
  //   print("Helllo From Closure");
  //   name = "B";
  // });
  // print(tt.toString());
  // tt();
  runApp(MyApp());
}

// String name = "A";
// helloWorld(Function tap) {
//   tap();

//   print(name);
// }

// Function tt = () {
//   print("Hello");
// };

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FixedHomePage(),
    );
  }
}

class HomePageBridge extends StatelessWidget {
  const HomePageBridge({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      controller: controller,
      children: [
        HomePage(
          onTT: () {
            controller.animateTo(
              10000,
              duration: Duration(seconds: 3),
              curve: Curves.ease,
            );
          },
        ),
        HomePage(
          onTT: () {
            controller.nextPage(
              duration: Duration(seconds: 2),
              curve: Curves.easeOutBack,
            );
          },
        ),
        HomePage(
          onTT: () {
            print(controller.offset);
            controller.nextPage(
              duration: Duration(seconds: 2),
              curve: Curves.easeOutBack,
            );
          },
        ),
      ],
    );
  }
}
