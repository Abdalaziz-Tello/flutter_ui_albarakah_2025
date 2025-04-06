import 'package:flutter/material.dart';
import 'package:nav_bar_and_splash_screen/view/templates_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> pages = [NewsPage(), MailPage(), MapsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        
        // shadowColor: Colors.black,
        // elevation: 0,
        // surfaceTintColor: Colors.white,
        // animationDuration: Duration(seconds: 4),
        // backgroundColor: Colors.red,
        // indicatorColor: Colors.green,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(
            // enabled: false,
            selectedIcon: Icon(Icons.facebook),
            tooltip: 'This is home',
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(icon: Icon(Icons.mail), label: 'Mail'),
          NavigationDestination(icon: Icon(Icons.maps_home_work), label: 'Map'),
        ],
      ),
    );
  }
}
