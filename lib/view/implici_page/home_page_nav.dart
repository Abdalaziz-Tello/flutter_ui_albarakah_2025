import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Hero(
        tag: 'A',
        child: Container(width: 200,height: 200,color: Colors.red,)) ,),
      floatingActionButton: FloatingActionButton(
        heroTag: "B",
        onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => HomePageNav(),));
      }),
    );
  }
}


class HomePageNav extends StatelessWidget {
  const HomePageNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            heroTag: "A",
            onPressed: (){}),
          FloatingActionButton(onPressed: (){}),
        ],
      ),
      body: Hero(
      
        tag: "B",
        child: Container(width: 100,height: 100,color: Colors.blue,)),
    );
  }
}