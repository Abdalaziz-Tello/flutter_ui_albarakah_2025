import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FixedHomePage extends StatelessWidget {
  FixedHomePage({super.key});
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: PageView(
              controller: controller,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("Skip")],
                      ),
                    ),
                    FlutterLogo(size: 220),
                  ],
                ),
                FlutterLogo(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller, // PageController
            count: 2,
            effect: WormEffect(), // your preferred effect
            onDotClicked: (index) {},
          ),
          InkWell(
            onTap: () {
              controller.nextPage(
                duration: Duration(seconds: 2),
                curve: Curves.bounceIn,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 317,
              height: 54,
              child: Center(child: Text("Next")),
            ),
          ),
        ],
      ),
    );
  }
}
