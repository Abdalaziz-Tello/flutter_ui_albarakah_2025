import 'package:flutter/material.dart';



class HomePageButStatefull extends StatefulWidget {
  HomePageButStatefull({super.key});

  @override
  State<HomePageButStatefull> createState() => _HomePageButStatefullState();
}

class _HomePageButStatefullState extends State<HomePageButStatefull> {
  
  int counter = 0;
  // TODO : 8 function => LifeCylce Statfull Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          print(counter);
          setState(() {
            
          });
        },
      ),
      body: Center(child: Text(counter.toString())),
    );
  }
}
