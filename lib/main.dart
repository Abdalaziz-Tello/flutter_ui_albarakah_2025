
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:responsive_and_adabtive/config/depencey_locater.dart';

void main() {
  // setup();
  runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home:HomePage() ,
    );
  }
}

late double width;
late double height;


class HomePage extends StatelessWidget {
   const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
 width=   MediaQuery.sizeOf(context).width;

 height=   MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: true, onChanged: (r){}),
          Text(width.toString() + " \n" + height.toString()),
          Checkbox.adaptive(value: true, onChanged:(r){}),
          
          CupertinoCheckbox(value: true, onChanged: (r){})
        ],
      )
      ,),

      floatingActionButton: FloatingActionButton(onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) =>core.get<ErrorPage>() ,));
        // showDialog(context: context, builder:(context) =>CupertinoDialogAction(child: Text("HEllo ")) ,);
      }),
    );
  }
}



class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}