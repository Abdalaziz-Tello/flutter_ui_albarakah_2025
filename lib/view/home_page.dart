
import 'package:depcency_of_app/core/res/app_string.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key,required this.onTap});
dynamic onTap;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:(){
        if (context.locale.languageCode=='ar') {
          context.setLocale(Locale("en"));
        } else {
          context.setLocale(Locale("ar"));
        }
      }),
      appBar:AppBar(

      ),
      body: Center(child: Text(AppString().DATA,style: TextStyle(fontSize: 32),),),
    );
  }
}