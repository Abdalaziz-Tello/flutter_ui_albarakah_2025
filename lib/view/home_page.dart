import 'package:flutter/material.dart';
import 'package:intro_to_statfull/main.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> names = ["Ahmad", "Moeyed", "Rami", "Mhd"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Hello",
            style: TextStyle(color: Colors.black),
            children: [
              WidgetSpan(child: FlutterLogo()),
              TextSpan(text: "World", style: TextStyle(color: Colors.pink)),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder:
            (context, index) => Dismissible(
              // dragStartBehavior: DragStartBehavior.down,
              // crossAxisEndOffset: 100,
              confirmDismiss: (direction) async {
                return true;
              },
              movementDuration: Duration(seconds: 2),
              resizeDuration: Duration(seconds: 2),
              background: Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete),
                color: Colors.red,
              ),
              // secondaryBackground: ,
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  names.removeAt(index);
                  print("object");
                } else {
                  print("Non");
                }
              },
              key: GlobalKey(),
              child: ListTile(
                leading: Tooltip(
                  richMessage: WidgetSpan(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("data"),
                    ),
                  ),
                  child: CircleAvatar(child: Text((index + 1).toString())),
                ),
                title: Text(names[index]),
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "This is a button for navigation",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TempPage()),
          );
        },
      ),
    );
  }
}
