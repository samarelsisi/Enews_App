import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news/style/apptheme.dart';
import 'package:news/ui/category_details/category_details.dart';
import 'package:news/ui/search/searchScreen.dart';
import 'package:news/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute: HomeScreen.routeName,
      routes:{
        HomeScreen.routeName:(context)=>HomeScreen(),

      },
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}


