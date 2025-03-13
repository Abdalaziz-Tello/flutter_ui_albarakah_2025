import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiles_and_context/view/constraint_example.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePageFromData());
  }
}

class HomePageFromData extends StatelessWidget {
  HomePageFromData({super.key});
  List<String> namesForReal = [
    "Ahmad",
    "Noor",
    "Yaser",
    "Ahmad",
    "Noor",
    "Yaser"
        "Ahmad",
    "Noor",
    "Yaser"
        "Ahmad",
    "Noor",
    "Yaser"
        "Ahmad",
    "Noor",
    "Yaser"
        "Ahmad",
    "Noor",
    "Yaser",
    "Ahmad",
    "Noor",
    "Yaser",
  ];

  Widget _buildAdsCompent() {
    return FlutterLogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: ListView.builder(
                // separatorBuilder:
                //     (context, index) => Divider(indent: 20, endIndent: 20),
                itemCount: namesForReal.length,
                itemBuilder:
                    (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      // selectedColor: Colors.red,
                      // enabled: false,
                      onTap: () {},
                      mouseCursor: SystemMouseCursors.click,
                      hoverColor: Colors.blue,
                      splashColor: Colors.yellow,
                      titleTextStyle: TextStyle(color: Colors.orange),

                      // selected: true,
                      title: Text(
                        namesForReal[index],
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
              ),
            ),
            CutsomButton(title: "Next", method: () {}),
          ],
        ),
        // child: ListView(
        // children: List.generate(
        //   namesForReal.length,
        //   (index) => ListTile(
        //     title: Text(namesForReal[index]),
        //     leading: CircleAvatar(child: Text(index.toString())),
        //   ),
        // ),
        // ),
      ),
    );
  }
}

class CutsomButton extends StatelessWidget {
  CutsomButton({super.key, required this.title, required this.method});
  String title;
  Function method;
  // ! YAGNI: You Aren't gonna need it
  // double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: method(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue.shade300,
          ),
          width: 317,
          height: 54,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
