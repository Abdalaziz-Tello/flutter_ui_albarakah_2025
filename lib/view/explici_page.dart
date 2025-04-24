import 'package:flutter/material.dart';

class ExplicitPage extends StatefulWidget {
  const ExplicitPage({super.key});

  @override
  State<ExplicitPage> createState() => _ExplicitPageState();
}

class _ExplicitPageState extends State<ExplicitPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation color;
  late Animation size;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    color = ColorTween(begin: Colors.grey, end: Colors.red).animate(controller);
    size = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 60.0, end: 90.0), weight: 4),
      TweenSequenceItem(tween: Tween(begin: 90.0, end: 75.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 75.0, end: 90.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 90.0, end: 60.0), weight: 4),
    ]).animate(controller);
    super.initState();
    // color.addStatusListener((status) {
    //             print(status);
    //           },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: color,
          builder: (context, _) {
            return IconButton(
              onPressed: () {
                if (controller.isCompleted || controller.isAnimating) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
                color.addStatusListener((status) {
                  print(status);
                });
              },
              icon: Icon(Icons.favorite, color: color.value, size: size.value),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   // controller.reverse();
      //   // controller.repeat();
      // }),
    );
  }
}
