
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 88,
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text("Hello World"),
                    subtitle: Text(
                      "Excepteur esse officia eiusmod eiusmod elit.",
                    ),
                    trailing: Icon(Icons.facebook),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 300,
                  height: 88,
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: Text("Hello World"),
                    subtitle: Text(
                      "Excepteur esse officia eiusmod eiusmod elit.",
                    ),
                    trailing: Icon(Icons.facebook),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
