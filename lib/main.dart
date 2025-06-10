import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:protfoliowebsite/view/homepage.dart';

import 'firebase_options.dart';

void main()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Outfit',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        primaryColor:Colors.black,
          textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
          )
      ),
          listTileTheme: ListTileThemeData(

      ),
        scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(

      )
      ),
      home: Homepage(),
    );
  }
}


