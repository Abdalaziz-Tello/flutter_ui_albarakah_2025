import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
                accountName: Text("abdtll99"),
                accountEmail: Text("abdtll992010@gmail.com"),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
            ],
          ),
        ),

        appBar: AppBar(
          leading: FlutterLogo(),
          title: Text("Exmple"),
          bottom: TabBar(
            tabs: [
              Icon(Icons.person),
              Icon(Icons.home),
              Icon(Icons.music_note),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      // ? How to change Button Style
                      // ? The Related With ThemeData
                      // style: ButtonStyle(),
                      child: Text("I am Elevated"),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        child: Text("I am Outlined"),
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                        child: Text("I am Filled"),
                        onPressed: () {},
                      ),
                    ),
                    TextButton(child: Text("I am Text"), onPressed: () {}),
                  ],
                ),
              ),
            ),
            Container(color: Colors.blue),
            Container(color: Colors.green),
          ],
        ),
        // ? Add builder to find Scaffold in the  context
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                // TODO : Find Anouther Way to open drawer 
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
      ),
    );
  }
}
