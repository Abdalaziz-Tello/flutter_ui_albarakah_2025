
import 'package:depcency_of_app/core/res/app_string.dart';
import 'package:depcency_of_app/view/temp_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key,required this.onTap});
dynamic onTap;
String name = "hello";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(onPressed:(){
        widget.onTap();
        // ? This is Why i Put "widget" keyword to get attibute
        print(widget.name);
        if (context.locale.languageCode=='ar') {
          context.setLocale(Locale("en"));
        } else {
          context.setLocale(Locale("ar"));
        }
      }),
      appBar:AppBar(
actions: [IconButton(onPressed: (){
  Navigator.push(context,MaterialPageRoute(builder: (context) => TempPage(),));
}, icon: Icon(Icons.textsms_sharp))],

      ),
      body: Center(child: Text(AppString().DATA,style: TextStyle(fontSize: 32),),),
    );
  }
}