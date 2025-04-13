
import 'package:depcency_of_app/view/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
late  SharedPreferences storage;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 storage=await SharedPreferences.getInstance();
  storage.setBool("theme",isDark);
  runApp(EasyLocalization(
    path: 'assets/translation',
    supportedLocales: [Locale('ar'),Locale('en')],
    fallbackLocale: Locale('en'),
    child: const MyApp(),),);
}


  bool isDark=storage.getBool('theme')!;
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme:ThemeData(scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black),
      themeMode:isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        onTap: (){
          isDark=!storage.getBool('theme')!;
          storage.setBool('theme',isDark);
          setState(() {
            
          });

        },
      ),
    );
  }
}
