
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black,
        centerTitle: true,
        // leading: FlutterLogo(),
        title: Text("Hello World"),
        actions: [FlutterLogo(), FlutterLogo()],
        backgroundColor: Colors.purple,
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Hello World"),
            Text("New Hello World"),
            Container(
              color: Colors.yellow,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [FlutterLogo(), FlutterLogo()],
              ),
            ),
            Text("Hello World"),
          ],
        ),
      ),
    );
  }
}
