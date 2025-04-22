import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
   ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
double width = 200;

double height = 200;

Color color= Colors.red;
double padding = 0;
double opacity=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // ? non logical behavior
            AnimatedPadding(padding: EdgeInsets.all(padding), duration: Duration(seconds: 3),
            
            child: AnimatedOpacity(opacity: opacity, duration: Duration(seconds: 3),
            child: Text("Hello World"),
            ),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: width,
              height: height,
              color: color,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        width=width+60;
        height=height+60;
        color=Colors.blue;
        padding=padding+20;
        opacity=1;
        setState(() {
          
          
        });
      }),
    );
  }
}


class HealineTextPage extends StatelessWidget {
   HealineTextPage({super.key});
  Tween<double> tween = Tween(begin: 0.0,end:1.0 );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TweenAnimationBuilder(tween: tween, duration: Duration(seconds: 4), builder: (context, value, child) => Opacity(opacity: value,child: Padding(padding: EdgeInsets.all(value*20),child: Text("Hello World",style: TextStyle(fontSize: value*32),),),),),
          Row(),
        
        ],
      ),
    );
  }
}