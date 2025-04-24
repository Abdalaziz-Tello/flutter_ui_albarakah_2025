import 'dart:math';

import 'package:flutter/material.dart';

class FlowButtonPage extends StatefulWidget {
  const FlowButtonPage({super.key});

  @override
  State<FlowButtonPage> createState() => _FlowButtonPageState();
}

class _FlowButtonPageState extends State<FlowButtonPage> with SingleTickerProviderStateMixin{

late AnimationController controller ;

@override
  void initState() {
    controller=AnimationController(vsync: this,duration: Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text("Hello From Flow"),),
      body: Center(
        child: Flow(delegate:MyDelegate(animation: controller) ,
        children:List.generate(3,(index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            child: Text(index.toString()),
            onPressed: (){
              controller.forward();
            }),
        ),) ,
        ),
      ),
    );
  }
}


class MyDelegate extends FlowDelegate {

Animation animation;
MyDelegate({required this.animation}):super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    for (var i = 0; i < context.childCount; i++) {
      
      context.paintChild(i,transform: Matrix4.translationValues(i*context.getChildSize(i)!.width*animation.value*Random().nextInt(2),i*context.getChildSize(i)!.width*animation.value*Random().nextInt(4), 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }



}